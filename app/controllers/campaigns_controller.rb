class CampaignsController < ApplicationController
  before_action :set_company, only: [:new, :create]
  def show
    @campaign = Campaign.find(params[:id])
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.company = Company.find(params[:company_id])
    if @campaign.save
      redirect_to @campaign.company
    else
      render :new
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end
end
