class RegistrationsController < Devise::RegistrationsController
  include Accessible
  def new
    super
  end

  def create
    build_resource(sign_up_params)
    # contractor = Contractor.create(first_name: resource.first_name, last_name: resource.last_name)
    # employer = Employer.create(first_name: resource.first_name, last_name: resource.last_name)
    #
    # resource.update(employer_id: employer.id, contractor_id: contractor.id) if contractor && employer
    #
    valid = resource.valid?
    session[:omniauth] = nil unless resource.new_record?
    if valid && resource.save!
      yield resource if block_given?
      if resource.persisted?
        if resource.active_for_authentication?
          set_flash_message! :notice, :signed_up
          sign_up(resource_name, resource)
          respond_with resource, location: after_sign_up_path_for(resource)
        else
          set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
          expire_data_after_sign_in!
          respond_with resource, location: after_inactive_sign_up_path_for(resource)
        end
      else
        devise_failure_errors
      end
    else
      devise_failure_errors
    end
  end

  def update
    super
  end

  protected
  def devise_failure_errors
    clean_up_passwords resource
    set_minimum_password_length
    respond_with resource
  end

  private

  def build_resource(*args)
    super
    if session[:omniauth]
      @user.apply_omniauth(session[:omniauth])
      @user.valid?
    end
  end
end