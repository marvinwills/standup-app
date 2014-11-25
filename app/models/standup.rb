class Standup < ActiveRecord::Base
	has_many :today_item, :yesterday_item
end
