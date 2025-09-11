class LineItemsController < ApplicationController
  def new
    @flavor = Flavor.find(params[:flavor_id])
    render layout: "modal"
  end

  def create
    flavor = Flavor.find(params[:flavor_id])
    order = find_or_create_order

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
      turbo_stream.update("flash", partial: "shared/flash")
    ]
  end

  private

  def find_or_create_order
    current_user.orders.find_by(status: "pre_flight") || create_new_order
  end

  def create_new_order
    Order.create!(
      user: current_user,
      status: "pre_flight"
    )
  end

  def current_user
    # For now, create a guest user or handle as needed
    # You might want to implement proper user authentication later
    User.find_or_create_by(username: "guest") do |user|
      user.name = "Guest User"
    end
  end
end
