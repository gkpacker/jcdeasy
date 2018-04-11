class CampaignsController < ApplicationController
  before_action :set_company, only: [:new, :create]
  def show
    @campaign = Campaign.find(params[:id])
  end

  def new
    @campaign = Campaign.new
  end

  def create

  end

  private

  def set_company
    @company = Company.find(params[:company_id])
  end
end
