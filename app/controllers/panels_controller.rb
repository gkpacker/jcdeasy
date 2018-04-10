class PanelsController < ApplicationController
  before_action :set_panel, only: [:show]

  def index
    @panels = Panel.all
  end

  def show
  end

  private

  def set_panel
    @panel = Panel.find(params[:id])
  end
end
