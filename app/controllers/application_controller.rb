class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  private

  def current_order
    current_user.orders.find_by(status: "pre_flight")
  end
  helper_method :current_order

  def current_user
    # For now, create a guest user or handle as needed
    # You might want to implement proper user authentication later
    User.find_or_create_by(username: "guest") do |user|
      user.name = "Guest User"
    end
  end
  helper_method :current_user

end
