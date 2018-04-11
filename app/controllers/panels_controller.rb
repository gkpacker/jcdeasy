class PanelsController < ApplicationController
  before_action :set_panel, only: [:show, :available, :calculate_dates]

  def index
    if params[:query].present?
      @panels = Panel.station_search(params[:query])
    else
      @panels = Panel.all
    end
  end

  def show
  end

  def available
    # /panels/1/available_dates || available_path(panel)
    render json: calculate_dates
  end

  def calculate_dates
    dates = []
    @panel.orders.each do |order|
      dates << { from: order.date.to_date,
                to: order.date.to_date + order.duration}
    end
    dates
  end

  private

  def set_panel
    @panel = Panel.find(params[:id])
  end
end
