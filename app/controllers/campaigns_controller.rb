class CampaignsController < ApplicationController
  def show
    @campaign = Campaign.find(params[:id])
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
      redirect_to stored_location_for(:user) || super
    else
      render :new
    end
  end

  private

  def campaign_params
    params.require(:campaign).permit(:title)
  end

end
