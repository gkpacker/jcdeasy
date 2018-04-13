class PanelsController < ApplicationController
  before_action :set_panel, only: [:show, :available, :calculate_dates]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    if params[:station].present?
      if params[:station].length > 1
        panels = []
        params[:station].each do |station|
          panels << Panel.includes(:panel_type).includes(:station).station_search(station)
        end
        @panels = panels.flatten
      else
        @panels = Panel.includes(:panel_type).includes(:station).station_search(params[:station])
      end
    else
      @panels = Panel.includes(:panel_type).includes(:station).includes(station: :lines).first(10)
    end
  end

  def show
    if user_signed_in?
      @dates = calculate_dates
      @order = @panel.orders.build
      @companies = Company.where(status: :active, user: current_user)
      @campaign = Campaign.new
      @company = Company.new
      @campaigns = []
      @companies.each do |company|
        company.campaigns.each do |campaign|
          @campaigns << campaign
        end
      end
    end
    if @panel.price == 0
      @price = @panel.panel_type.price
    else
      @price = @panel.price
    end
  end

  def available
    # /panels/1/available_dates || available_path(panel)
    render json: calculate_dates
  end

  def calculate_dates
    dates = []
    @panel.orders.each do |order|
      start_date = order.date.to_date
      dates << { from: start_date.strftime("%d/%m/%Y"),
                to: (start_date + order.duration).strftime("%d/%m/%Y") }
    end
    dates
  end

  private

  def set_panel
    @panel = Panel.find(params[:id])
  end
end
