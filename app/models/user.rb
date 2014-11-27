class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
		 
  has_many :standups, dependent: :destroy
  accepts_nested_attributes_for :standups, :reject_if => :all_blank, :allow_destroy => true
end
