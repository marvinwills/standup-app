class Standup < ActiveRecord::Base
  has_many :yesterday_items, -> { order "created_at" }, dependent: :destroy, class_name: "Item"
  has_many :today_items, -> { order "created_at" }, dependent: :destroy, class_name: "Item"
  accepts_nested_attributes_for :today_items, :reject_if => :all_blank, :allow_destroy => true
  accepts_nested_attributes_for :yesterday_items, :reject_if => :all_blank, :allow_destroy => true

  belongs_to :user

  validate :date_scope

  private
  def date_scope
    if Standup.where("user_id = ? AND DATE(created_at) = DATE(?)", self.user_id, Time.now).all.any?
      errors.add(:user_id, "Can only create once a day")
    end
  end
end
