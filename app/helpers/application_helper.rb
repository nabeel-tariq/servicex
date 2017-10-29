module ApplicationHelper

  def bootstrap_class_for flash_type
    { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.with_indifferent_access[flash_type] || flash_type.to_s
  end

  def flash_messages(opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, message, class: "alert #{bootstrap_class_for(msg_type)} fade in") do
        concat content_tag(:button, 'x', class: "close", data: { dismiss: 'alert' })
        concat message
      end)
    end
    nil
  end

  def url_mapping user
    url_path =user.profileable_type == 'Employer' ? edit_employer_path(user.profileable_id) : edit_contractor_path(user.profileable_id) if user
    url_path
  end
  
  def setup_profileable_model(profile_model)
    #TODO move to controller
    profile_model.contact_numbers.length > 0 ? profile_model.contact_numbers : profile_model.contact_numbers.build
    profile_model.location ||= Location.new
    (profile_model.location && profile_model.location.contact_numbers.length > 0) ? profile_model.location.contact_numbers : profile_model.location.contact_numbers.build
    profile_model.attachments.length > 0 ? profile_model.attachments : profile_model.attachments.build
    profile_model
  end
end