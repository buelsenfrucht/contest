class Activity < ActiveRecord::Base

  belongs_to :user

  validates :body, presence: true

  scope :published, -> { where(publish: true) }

end
