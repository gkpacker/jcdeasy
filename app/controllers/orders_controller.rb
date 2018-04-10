class OrdersController < ApplicationController
  before_action :set_order, except: [:new, :create]
  def new
    @order = Order.new
    @panel = Panel.find(params[:panel_id])
  end

  def create
    @order = Order.new(order_params)
  end

  def update

  end

  def destroy
    if @order.destroy
    else
    end
  end

  private

  def order_params
    params.require(:order).permit(:date, :duration, :quantity, :campaign_id, :panel_id)
  end

  def set_order
    @order = Order.find(params[:id])
  end
end
