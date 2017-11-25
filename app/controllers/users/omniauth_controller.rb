class Users::OmniauthController < ApplicationController
  def facebook
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    user_available = User.find_by_email(omniauth.info.email)
    if authentication
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect authentication.user
    elsif current_user
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Authentication successful."
      redirect_to authentications_url
    elsif user_available && authentication == nil
      user_available.apply_omniauth(omniauth)
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect user_available
    else
      user = User.new
      employer_child_class = "employer".camelize.constantize
      contractor_child_class = "contractor".camelize.constantize
      user.profileable = employer_child_class.new(first_name: omniauth.info.name.split[0], last_name: omniauth.info.name.split[1])
      user.profileable = contractor_child_class.new(first_name: omniauth.info.name.split[0], last_name: omniauth.info.name.split[1])
      user.email = omniauth.info.email
      user.password = Devise.friendly_token[0, 20]
      if user.save!
        user.apply_omniauth(omniauth)
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect user
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end

  def google_oauth2
    omniauth = request.env["omniauth.auth"]
    authentication = Authentication.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    user_available = User.find_by_email(omniauth.info.email)

    if authentication
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect authentication.user
    elsif current_user
      current_user.authentications.create!(:provider => omniauth['provider'], :uid => omniauth['uid'])
      flash[:notice] = "Authentication successful."
      redirect_to authentications_url
    elsif user_available && authentication == nil
      user_available.apply_omniauth(omniauth)
      flash[:notice] = "Signed in successfully."
      sign_in_and_redirect user_available
    else
      user = User.new
      employer_child_class = "employer".camelize.constantize
      contractor_child_class = "contractor".camelize.constantize
      user.profileable = employer_child_class.new(first_name: omniauth.info.name.split[0], last_name: omniauth.info.name.split[1])
      user.profileable = contractor_child_class.new(first_name: omniauth.info.name.split[0], last_name: omniauth.info.name.split[1])
      user.email = omniauth.info.email
      user.password = Devise.friendly_token[0, 20]
      if user.save!
        user.apply_omniauth(omniauth)
        flash[:notice] = "Signed in successfully."
        sign_in_and_redirect user
      else
        session[:omniauth] = omniauth.except('extra')
        redirect_to new_user_registration_url
      end
    end
  end

  def failure
    flash[:error] = 'There was a problem signing you in. Please register or try signing in later.'
    redirect_to new_user_registration_url
  end
end