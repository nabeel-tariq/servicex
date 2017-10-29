Paperclip.interpolates :image_type do |attachment, style|
    "#{attachment.instance.attachable_type.to_s.downcase}/#{attachment.instance.image_type.downcase}"
end