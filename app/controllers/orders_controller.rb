class OrdersController < ApplicationController
  before_action :set_panel, only: :create
  before_action :set_order, except: :create

  def create
    @order = @panel.orders.build(order_params)
    @order.price_cents = @order.panel.price_cents * @order.duration.divmod(28).first
    if @order.save
      redirect_to campaign_path(@order.campaign)
    else
      redirect_to panel_path(@order.panel_id)
    end
  end

  def update

  end

  def destroy
    if @order.destroy
    else
    end
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
end
