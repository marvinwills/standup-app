class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
		 
  has_many :standups, -> { order "created_at DESC" }, dependent: :destroy
  mount_uploader :avatar, AvatarUploader

end
