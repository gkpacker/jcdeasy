class CampaignsController < ApplicationController
  before_action :find_campaign, only: [:show, :edit, :update, :paid]
  before_action :find_companies, only: [:new, :create, :edit, :update]
  skip_before_action :verify_authenticity_token, only: :paid

  def show
    @total = 0
    @total_cents = 0
    @orders = []
    @campaign.orders.includes(:panel).includes(panel: :panel_type).each do |order|
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
    if params[:campaign][:company].present?
      @campaign.company = Company.find(params[:campaign][:company])
      if @campaign.save
        sweetalert(' ', "Campanha '#{@campaign.title}' criada com sucesso", opts = { icon: 'success', button: false, timer: 1400 } )
        redirect_to request.referer
      else
        sweetalert("Você precisa nomear sua campanha", "Erro ao criar campanha", opts = { icon: 'error', button: true } )
        redirect_to stored_location_for(:user)
      end
    else
      sweetalert("Você deve associar a campanha à uma empresa", "Erro ao criar campanha", opts = { icon: 'error', button: true } )
      redirect_to stored_location_for(:user)
    end
  end


  def edit
  end

  def update
    if @campaign.update(campaign_params)
      redirect_to campaign_path(@campaign)
    else
      render :edit
    end
  end

  def paid
    @campaign.paid = true
    @campaign.save
  end

  private

  def find_campaign
    @campaign = Campaign.find(params[:id])
  end

  def find_companies
    @companies = Company.where(status: :active, user: current_user)
  end

  def campaign_params
    params.require(:campaign).permit(:title, :company_id, :paid)
  end

end
