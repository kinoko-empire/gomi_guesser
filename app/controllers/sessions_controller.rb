class SessionsController < ApplicationController
  allow_unauthenticated_access only: %i[ new create ]
  rate_limit to: 10, within: 3.minutes, only: :create, with: -> { redirect_to new_session_url, alert: "Try again later." }

  def new
    if auth_session = authenticated?
      if auth_session.user.role == "admin"
        return redirect_to admin_dashboard_path
      elsif auth_session.user.role == "standard"
        return redirect_to "/"
      end
    end

    render inertia: { create_session_path: session_path } # can add ",clear_history: true" as an option
    # and it kind of does what I want. Does not navigate signed out user to a page requiring auth
    # if they press the back button after logging out, however it does change the url to the previously visited auth route?
  end

  def create
    if user = User.authenticate_by(params.permit(:email_address, :password))
      start_new_session_for user
      redirect_to after_authentication_url
    else
      redirect_to new_session_path, alert: "Try another email address or password."
    end
  end

  def destroy
    terminate_session
    redirect_to new_session_path
  end
end
