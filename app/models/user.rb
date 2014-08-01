class User < ActiveRecord::Base

  has_many :goals
  has_many :milestones

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email

  has_secure_password

  def score_for_user(user)
    return nil if goals.size == 0
    score = 0
    goals.each do |goal|
      milestones_per_type = Milestone.for_user(user).where(type: goal.type).order('created_at ASC').all
      next if milestones_per_type.size == 0

      first_milestone = milestones_per_type.last
      relevant_milestone = milestones_per_type.last
      diff = (relevant_milestone - first_milestone).abs
      goal.value
    end
  end

end
