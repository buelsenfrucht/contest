class User < ActiveRecord::Base
  has_secure_password

  has_many :goals
  has_many :milestones

  validates :email, presence: true
  validates_uniqueness_of :email
end
