class PanelsController < ApplicationController
  before_action :set_panel, only: [:show, :available, :calculate_dates]

  def index
    if params[:station].present?
      @panels = Panel.station_search(params[:station])
    else
      @panels = Panel.all
    end
  end

  def show
    @dates = calculate_dates
    @order = @panel.orders.build
    @campaigns = []
    current_user.companies.each do |company|
      company.campaigns.each do |campaign|
        @campaigns << campaign
      end
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
      dates << { from: start_date,
                to: start_date + order.duration }
    end
    dates
  end

  private

  def set_panel
    @panel = Panel.find(params[:id])
  end
end
