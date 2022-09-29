class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  include ImageUploader::Attachment(:image)
         
  
  has_many :meetings, dependent: :destroy

  validates :role, numericality: { greater_than_or_equal_to: 0, less_than: 2 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :age, presence: true
  # validates :password, presence: true
end
