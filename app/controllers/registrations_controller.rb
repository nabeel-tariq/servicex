class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    build_resource(sign_up_params)
    child_class = resource.profileable_type.camelize.constantize if resource.profileable_type == 'employer' || resource.profileable_type == 'contractor'
    resource.profileable = child_class.new
    valid = resource.valid?
    valid = resource.profileable.valid? && valid

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
end