class Item < ActiveRecord::Base
  belongs_to :standup

  scope :today_items, -> { where(:today =>  true) }
  scope :yesterday_items, -> { where(:today =>  false) }

  validates :standup, :presence => true
  validates :content, :presence => true, length: { :minimum => 5 }
  validates :today, :inclusion => { :in => [true, false] }
end
