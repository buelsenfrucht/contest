class Type < ActiveRecord::Base

  has_many :goals
  has_many :milestones

  def to_s
    I18n.translate("types.#{name}")
  end

end
