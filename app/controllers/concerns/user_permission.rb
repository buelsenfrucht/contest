
module UserPermission
  extend ActiveSupport::Concern

  included do
    before_action :check_permission
  end

  protected

  def check_permission
    if !current_user || params[:user_id].to_i != current_user.id.to_i
      render file: 'public/401.html', :status => :unauthorized
    end
  end

end