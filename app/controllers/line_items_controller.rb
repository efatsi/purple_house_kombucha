class LineItemsController < ApplicationController
  def new
    @flavor = Flavor.find(params[:flavor_id])
    render layout: "modal"
  end

  def create
    flavor = Flavor.find(params[:flavor_id])
    order = current_order || create_new_order

    line_item = order.line_items.find_or_initialize_by(flavor: flavor, bottle_size: params[:bottle_size])

    if line_item.persisted?
      line_item.increment(:count, params[:count].to_i)
    else
      line_item.count = params[:count].to_i
    end

    if line_item.save
      flash.now[:notice] = "#{flavor.name} added to your order!"
    else
      flash.now[:alert] = "Error adding item to order."
    end

    render turbo_stream: [
      turbo_stream.update("modal_frame", ""),
      turbo_stream.update("flash", partial: "shared/flash"),
      turbo_stream.update("header", partial: "shared/header")
    ]
  end

  def update
    @line_item = LineItem.find(params[:id])

    if @line_item.update(count: params[:line_item][:count].to_i)
      redirect_to checkout_path, notice: "Item updated successfully!"
    else
      redirect_to checkout_path, alert: "Error updating item."
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    redirect_to checkout_path, notice: "Item removed from cart."
  end

  private

  def create_new_order
    Order.create!(
      user: current_user,
      status: "pre_flight"
    )
  end
end
