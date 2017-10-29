class Attachment < ApplicationRecord
  belongs_to :attachable, polymorphic: true
  validates_presence_of :name, :image_type
  has_attached_file :document,default_url: "#{APP_URL}/missing.png",preserve_files: true, :styles => lambda { |a| a.instance.is_image? ? {medium: '300x300>', thumb: '100x100>'} : {} },
                    :url => "#{APP_URL}/system/:class/:attachment/:image_type/:hash/:filename",
                    :path => lambda { |a| ":rails_root/public/system/:class/:attachment/:image_type/:hash/:filename" },
                    hash_secret: "6711203d2886152b7ed71ec9cfc79e1d51aab530b2e3e4eb46734e1180bdade407289c46bc17426e69a1cd95f07cbe9e7a3e7261017b59ae88b0b9b0b380e84c"
  validates_attachment_size :document, :in => 0.megabytes..200.megabytes
  validates_attachment_content_type :document,  :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"], message: 'This attachment type is not acceptable.'


  def is_image?
    #document.instance.attachment_content_type =~ %r(image)
    return false
  end
end
