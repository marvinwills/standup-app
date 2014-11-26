class Standup < ActiveRecord::Base
	has_many :yesterday_items, dependent: :destroy
	has_many :today_items, dependent: :destroy
	accepts_nested_attributes_for :today_items
	accepts_nested_attributes_for :yesterday_items
end
