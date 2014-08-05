class User < ActiveRecord::Base

  has_many :activities
  has_many :goals
  has_many :milestones

  validates :name, presence: true
  validates :email, presence: true
  validates_uniqueness_of :email

  has_secure_password

  def score
    return 0.0 if goals.size == 0
    score = 0.0
    goals.each do |goal|
      score = score + goal.score
    end
    return (score / goals.size.to_f)
  end

  def to_s
    name
  end

end
