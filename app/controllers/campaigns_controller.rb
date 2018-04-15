class CampaignsController < ApplicationController
  before_action :find_campaign, only: [:show, :edit, :update]

  def show
    @total = 0
    @total_cents = 0
    @orders = []
    @campaign.orders.each do |order|
      @orders << { id: order.id,
                  title: order.panel.panel_type.name,
                  unit_price: order.price_cents,
                  quantity: 1,
                  tangible: true
                  }
      @total += order.price
      @total_cents += order.price_cents
    end
  end

  def new
    @campaign = Campaign.new
  end

  def create
    @campaign = Campaign.new(campaign_params)
    @campaign.company = Company.find(params[:campaign][:company])
    if @campaign.save
      redirect_to stored_location_for(:user)
    else
      render :new
    end
  end


  def edit
  end

  def update
    if @campaign.update(campaign_params)
      redirect_to campaign_path
    else
      render :edit
    end
  end

  private

  def find_campaign
    @campaign = Campaign.find(params[:id])
  end

  def campaign_params
    params.require(:campaign).permit(:title, :company_id)
  end

end
