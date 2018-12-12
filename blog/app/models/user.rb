class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  #Devise default validations for user authentication
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #creating association with posts     
  has_many :posts
end
