class CheckoutController < ApplicationController
  def show
    @order = current_order

    if @order.nil? || @order.line_items.empty?
      redirect_to shop_path, alert: "Your cart is empty."
      return
    end

    @line_items = @order.line_items.includes(:flavor)
  end

  def submit
    @order = current_order

    if @order.nil? || @order.line_items.empty?
      redirect_to shop_path, alert: "Your cart is empty."
      return
    end

    @order.update!(status: "open")

    redirect_to root_path, notice: "Order submitted successfully! We'll prepare your kombucha shortly."
  end
end
