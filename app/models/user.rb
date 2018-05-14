class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  mount_uploader :avatar, PhotoUploader

  has_many :comments, dependent: :destroy
  has_many :restaurants, through: :comments 

  validates_presence_of :name
  def admin?
    self.role == "admin"
  end

  
end
