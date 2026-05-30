class ApplicationController < ActionController::Base
  include Authentication
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  inertia_share auth: -> {
    if user_session = authenticated?
      {
        user: {
          user_id: user_session.user.id,
          email: user_session.user.email_address,
          role: user_session.user.role,
          username: user_session.user.username
        }
      }
    end
  }
end
