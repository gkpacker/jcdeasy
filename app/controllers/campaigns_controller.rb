class CampaignsController < ApplicationController
  before_action :set_company, only: [:new, :create]
  def show
    @campaign = Campaign.find(params[:id])
    @total = 0
    @total_cents = 0
    @campaign.orders.each do |order|
      @total += order.price
    end
    @campaign.orders.each do |order|
      @total_cents += order.price_cents
    end
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


  # require 'pagarme'

  # PagarMe.api_key = "ak_test_Cj4zU15ZgUEcixiy6IaF5ocKxDoP4j";

  # transaction = PagarMe::Transaction.find_by_id("TOKEN")
  # transaction.capture({:amount => 1000})



  private

  def campaign_params
    params.require(:campaign).permit(:title)
  end

  def set_company
    @company = Company.find(params[:company_id])
  end
end
