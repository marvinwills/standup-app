class Standup < ActiveRecord::Base
	has_many :yesterday_items, dependent: :destroy
	has_many :today_items, dependent: :destroy
end
