class Goal < ActiveRecord::Base
  belongs_to :type
  belongs_to :user

  validates :type, presence: true
  validates :user, presence: true
end
