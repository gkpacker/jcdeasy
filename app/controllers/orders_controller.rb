class OrdersController < ApplicationController
  before_action :set_panel, only: :create
  before_action :set_order, except: :create

  def create
    @order = @panel.orders.build(order_params)
    if @order.cover?
      redirect_to panel_path(@order.panel), alert: "Você escolheu uma data indisponível para este painel"
    else
      if @panel.price == 0
        @order.price_cents = @panel.panel_type.price_cents * @order.duration.divmod(28).first
      else
        @order.price_cents = @panel.price
      end
      if @order.save
        sweetalert(' ', 'Painel adicionado com sucesso', opts = { icon: 'success', button: false, timer: 1400 } )
        redirect_to campaign_path(@order.campaign), notice: "Painel adicionado à campanha com sucesso."
      else
        redirect_to panel_path(@order.panel_id), alert: "Não foi possível salvar as informações."
      end
    end
  end

  def update
    @order.update(art_params)
    @campaign = @order.campaign
    head :ok
    # redirect_to campaign_path(@order.campaign)
  end

  def destroy
    @order.destroy
    redirect_to campaign_path(@order.campaign)
  end

  private

  def set_panel
    @panel = Panel.find(params[:panel_id])
  end

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:date, :duration, :quantity, :campaign_id, :panel_id)
  end

  def art_params
    params.permit(:art, :art_cache)
  end
end
