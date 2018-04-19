class PanelsController < ApplicationController
  before_action :set_panel, only: [:show, :available, :calculate_dates]
  skip_before_action :store_user_location!, only: :show
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:station].present?
      if params[:station].length > 1
        panels = []
        params[:station].each do |station|
          panels << Panel.includes(:panel_type).includes(:station).station_search(station)
        end
        @panels = Kaminari.paginate_array(panels.flatten).page(params[:page]).per(24)
      else
        @panels = Panel.includes(:panel_type).includes(:station).page(params[:page]).per(24).station_search(params[:station])
      end
    else
      @panels = Panel.includes(:panel_type).includes(:station).includes(station: :lines).page(params[:page])
    end
  end

  def show
    @back = stored_location_for(:user)
    if user_signed_in?
      @dates = @panel.calculate_dates
      @order = @panel.orders.build
      @companies = Company.where(status: :active, user: current_user)
      @campaign = Campaign.new
      @company = Company.new
      @campaigns = []
      @companies.includes(:campaigns).each do |company|
        company.campaigns.each do |campaign|
          @campaigns << campaign unless campaign.paid && campaign.archived?
        end
      end
    end
    if @panel.price == 0
      @price = @panel.panel_type.price
      @price_cents = @panel.panel_type.price_cents
    else
      @price = @panel.price
      @price_cents = @panel.price_cents
    end
  end

  def available
    # /panels/1/available_dates || available_path(panel)
    dates = @panel.calculate_dates
    render json: dates
  end


  private

  def set_panel
    @panel = Panel.find(params[:id])
  end
end
