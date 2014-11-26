class Standup < ActiveRecord::Base
	has_many :yesterday_items, dependent: :destroy
end
