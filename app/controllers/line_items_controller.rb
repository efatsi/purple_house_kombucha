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
    if session[:order_id]
      Order.find_by(id: session[:order_id]) || create_new_order
    else
      create_new_order
    end
  end

  def create_new_order
    order = Order.create!(
      user: current_user_or_guest,
      status: "open"
    )
    session[:order_id] = order.id
    order
  end

  def current_user_or_guest
    # For now, create a guest user or handle as needed
    # You might want to implement proper user authentication later
    User.find_or_create_by(username: "guest") do |user|
      user.name = "Guest User"
    end
  end
end
