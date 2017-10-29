module ApplicationHelper
  def setup_profileable_model(profile_model)
    profile_model.contact_numbers.length > 0 ? profile_model.contact_numbers : profile_model.contact_numbers.build
    profile_model.location ||= Location.new
    (profile_model.location && profile_model.location.contact_numbers.length > 0) ? profile_model.location.contact_numbers : profile_model.location.contact_numbers.build
    profile_model.attachments.length > 0 ? profile_model.attachments : profile_model.attachments.build
    profile_model
  end
end