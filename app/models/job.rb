class Job < ApplicationRecord
  has_many :attachments, as: :attachable, dependent: :destroy
  has_many :biddings, dependent: :destroy
  has_many :jobs_services, dependent: :destroy
  has_many :services, through: :jobs_services
  has_many :orders, dependent: :destroy

  has_one :location, as: :locationable, dependent: :destroy

  belongs_to :employer

  enum ad_type: {personal: 0, business: 1}
  enum status: {active: 0, inactive: 1}

  accepts_nested_attributes_for :attachments
  accepts_nested_attributes_for :location
  accepts_nested_attributes_for :jobs_services

  validates_presence_of :name, :description, :employer_id

  include PgSearch
  pg_search_scope :search_name, :against => [:name,:budget,:description,:ad_type], :using => { :tsearch => {:prefix => true} },
      :associated_against => {
          :services => [:name],
          :location => :name
      }

  def initialize_nested_attributes
    self.attachments.length > 0 ? self.attachments : self.attachments.build
    self.location ||= Location.new
    self.jobs_services.length > 0 ? self.jobs_services : self.jobs_services.build
    self
  end

  def latest_image
    attachments.present? ? attachments.last.document.url(:small) : "#{APP_URL}/images/missing.png"
  end

  def total_images_count
    attachments.length > 0 ? attachments.count : 0
  end

  private
  def self.set_search_params options, params
    # Handle Default Values
    radius = params[:radius].present? ? "#{params[:radius].to_i*1000}" : 5000

    options[:conditions].deep_merge!(ad_type: params[:ad_type]) if params[:ad_type].present? && params[:ad_type] != "All"
    options[:conditions].deep_merge!(:services => {id: params[:services]}) if params[:services].present?
    options[:raw_conditions] << ["budget >=#{params[:budget_from]}"] if params[:budget_from].present?
    options[:raw_conditions] << ["budget <=#{params[:budget_to]}"] if params[:budget_to].present?
    options[:raw_conditions] << ["earth_box(ll_to_earth(#{params[:latitude]}, #{params[:longitude]}), #{radius})@> ll_to_earth(latitude, longitude)"] if params[:latitude].present? && params[:longitude].present?
    options[:raw_conditions] = [options[:raw_conditions].map(&:first).join(' AND '),options[:raw_conditions].map(&:last)]
    options[:attachment_joins] = [:attachments] if params[:with_images].present?
  end
end