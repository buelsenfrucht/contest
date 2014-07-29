class Milestone < ActiveRecord::Base
  belongs_to :type
  belongs_to :user

  validates :type, presence: true
  validates :user, presence: true
  validates :value, presence: true
end
