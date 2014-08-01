class GoalsController < ApplicationController

  before_action :check_permission
  before_action :set_user
  before_action :set_goal, only: [:show, :destroy]

  # GET /goals
  def index
    @goals = Goal.for_user(current_user).all
  end

  # GET /goals/1
  def show
  end

  # GET /goals/new
  def new
    @goal = Goal.new
  end

  # GET /goals/1/starting_point
  def starting_point
    @goal = Goal.find(params[:goal_id])
    @milestone = Milestone.where(user: current_user).where(type: @goal.type).where(is_first: true).first
    if @milestone.blank?
      @milestone = Milestone.new(user: current_user, type: @goal.type, is_first: true, achieved_at: Date.today)
    end
  end

  # POST /goals
  def create
    @goal = Goal.new(goal_params)
    @goal.user = @user
    @goal.value = goal_params[:value]

    if @goal.save
      redirect_to user_goals_url(@user), notice: 'Goal was successfully created.'
    else
      render :new
    end
  end

  # DELETE /goals/1
  def destroy
    @goal.destroy
    redirect_to user_goals_url(@user), notice: 'Goal was successfully destroyed.'
  end

  private

    def check_permission
      if !current_user || params[:user_id].to_i != current_user.id.to_i
        render file: 'public/401.html', :status => :unauthorized
      end
    end

    def set_user
      @user = User.find(params[:user_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_goal
      @goal = Goal.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def goal_params
      params.require(:goal).permit(:type_id, :user_id, :value)
    end
end
