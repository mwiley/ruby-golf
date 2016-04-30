class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :current_password

  has_many :submissions, dependent: :destroy
  validates :username, presence: true, uniqueness: true, length: { minimum: 2, maximum: 20 }
end
