class PanelsController < ApplicationController
  before_action :set_panel, only: [:show]

  def index
    if params[:query].present?
      @panels = Panel.station_search(params[:query])
    else
      @panels = Panel.all
    end
  end

  def show
  end

  private

  def set_panel
    @panel = Panel.find(params[:id])
  end
end
