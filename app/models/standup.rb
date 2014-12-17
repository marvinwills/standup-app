class Standup < ActiveRecord::Base

  has_many :items, -> { order "created_at" }, :dependent => :destroy
  belongs_to :user

  validates :user, :presence => true
  validate :creation_limit, :on => :create

  private

  def creation_limit
    if has_standup_for_today?
      errors.add(:user_id, "Can only create once a day")
    end
  end

  def has_standup_for_today?
    Standup.where("user_id = ? AND DATE(created_at) = DATE(?)", self.user_id, Time.now).any?
  end

end
