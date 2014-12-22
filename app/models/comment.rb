class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :standup

  validates :user, :presence => true
  validates :standup, :presence => true
  validates :text, :presence => true

end
