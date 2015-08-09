class Message < ActiveRecord::Base
  validates :author, presence: true
  validates :content, presence: true
   validates_format_of :url, :with => URI::regexp(%w(http https))
end

