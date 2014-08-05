class DashboardController < ApplicationController

  def show
    @my_goals = Goal.for_user(current_user)
    @activities = Activity.published.order('created_at DESC').all

    @ranking = User.all.sort_by{|u| -u.score }
  end

end
