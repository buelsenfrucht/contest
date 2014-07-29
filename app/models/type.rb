class Type < ActiveRecord::Base

  has_many :goals
  has_many :milestones

  def to_s
    Rails.logger.debug "TEST"
    I18n.translate("types.#{name}")
  end

end
