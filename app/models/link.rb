class Link < ActiveRecord::Base
  validates_presence_of :url
  validates :url, url: true

  validates_uniqueness_of :slug

  before_validation :generate_slug

  def generate_slug
    self.slug = SecureRandom.uuid[0..10] if self.slug.nil? || self.slug.empty?
    true
  end
end
