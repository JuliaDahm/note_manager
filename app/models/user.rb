class User < ActiveRecord::Base
  has_many :notes, dependent: :destroy
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
