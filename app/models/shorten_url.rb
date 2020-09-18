class ShortenUrl < ApplicationRecord
  serialize :country
  serialize :ip_address
  LENGTH = 5
  validates_presence_of :url
  validates_format_of :url, :with => /\A(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w\.-]*)*\/?\Z/i

  has_many :users, :dependent => :destroy
  before_create :generate_short_url

  def not_exists?
    ShortenUrl.find_by_url(self.url).nil?
  end

  def format_url
    self.url = "http://#{self.url}" unless self.url[/^https?/]
  end

  def generate_short_url
    new_url = ([*('a'..'z'),*('0'..'9')]).sample(LENGTH).join
    old_url = ShortenUrl.find_by_short_url(new_url)
    if old_url.nil?
      self.short_url = new_url
    else
      self.generate_short_url
    end 
  end

end
