class Milestone < ActiveRecord::Base

  belongs_to :type
  belongs_to :user

  validates :type, presence: true
  validates :user, presence: true
  validates :value, presence: true

  def value
    v = read_attribute(:value)
    if self.type.name == 'weight'
      v = v.to_f / 1000.0
    end
    return v
  end

  def value=(value)
    Rails.logger.debug self.type.name
    if self.type.name == 'weight'
      value = value.to_f * 1000.0
    end
    write_attribute(:value, value.to_i)
  end

end
