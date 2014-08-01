class Goal < ActiveRecord::Base
  belongs_to :type
  belongs_to :user

  validates :type, presence: true
  validates :user, presence: true
  validates :value, presence: true

  scope :for_user, ->(user) { where(user: user) }
  scope :with_first_milestone, -> { includes(:milestone).where('milestones.is_first = 1') }

  def first_milestone
    Milestone.where(is_first: true, type: self.type, user: self.user).first
  end

  def value
    value = read_attribute(:value)
    if self.type and self.type.name == 'weight'
      value = value.to_f / 1000.0
    end
    return value
  end

  def value=(value)
    if self.type and self.type.name == 'weight'
      value = value.to_f * 1000.0
    end
    write_attribute(:value, value.to_i)
  end
end
