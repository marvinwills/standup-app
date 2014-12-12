class Item < ActiveRecord::Base
  belongs_to :standup
  validates :content, presence: true, length: { minimum: 5 }
  #validates :today, presence: true
end
