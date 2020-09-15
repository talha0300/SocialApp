class User < ApplicationRecord
  has_many:notifications
  has_many :posts
  has_many :followships
  has_many :followees, through: :followships

  has_many :inverse_followships,class_name: "Followship",foreign_key:"followee_id"
  has_many :inverse_followees, through: :inverse_followships,source: :user
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,:confirmable,
         :recoverable, :rememberable, :validatable
end
