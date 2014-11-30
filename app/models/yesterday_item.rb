class YesterdayItem < ActiveRecord::Base
	belongs_to :standup
	validates :item, presence: true, length: { minimum: 5 }
end
