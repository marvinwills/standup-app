class Standup < ActiveRecord::Base
	has_many :yesterday_items, dependent: :destroy
	has_many :today_items, dependent: :destroy
	accepts_nested_attributes_for :today_items, :reject_if => :all_blank, :allow_destroy => true
	accepts_nested_attributes_for :yesterday_items, :reject_if => :all_blank, :allow_destroy => true
	
	belongs_to :user
end
