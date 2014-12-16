class Standup < ActiveRecord::Base

  has_many :items, -> { order "created_at" }, :dependent => :destroy
  belongs_to :user

  validates :user, :presence => true
  validate :date_scope, :on => :create

  private

  def date_scope
    if Standup.where("user_id = ? AND DATE(created_at) = DATE(?)", self.user_id, Time.now).count > 0
      errors.add(:user_id, "Can only create once a day")
    end
  end
end
