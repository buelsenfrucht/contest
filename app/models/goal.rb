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

  def score
    milestones_per_type = Milestone.for_user(self.user).where(type: self.type).order('created_at ASC').all
    return 0.0 if milestones_per_type.blank? or milestones_per_type.size == 0

    first_milestone = milestones_per_type.first
    last_milestone = milestones_per_type.last
    goal_diff = (self.value - first_milestone.send(:value)).abs
    current_diff = (last_milestone.send(:value) - first_milestone.send(:value)).abs
    return ((current_diff.to_f / goal_diff.to_f) * 100)
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
