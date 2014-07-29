class MilestonesController < ApplicationController

  before_action :check_permission

  before_action :set_user
  before_action :set_milestone, only: [:show, :edit, :update, :destroy]

  # GET /milestones
  def index
    @milestones = Milestone.order('created_at DESC').all
  end

  # GET /milestones/1
  def show
  end

  # GET /milestones/new
  def new
    @milestone = Milestone.new
  end

  # GET /milestones/1/edit
  def edit
  end

  # POST /milestones
  def create
    @milestone = Milestone.new(milestone_params)
    @milestone.user = @user
    @milestone.achieved_at = Date.today

    if @milestone.save
      redirect_to user_milestones_url(@user), notice: 'Milestone was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /milestones/1
  def update
    if @milestone.update(milestone_params)
      redirect_to user_milestones_url(@user), notice: 'Milestone was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /milestones/1
  def destroy
    @milestone.destroy
    redirect_to user_milestones_url(@user), notice: 'Milestone was successfully destroyed.'
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
    def set_milestone
      @milestone = Milestone.find(params[:id])
      @milestone.user = @user
    end

    # Only allow a trusted parameter "white list" through.
    def milestone_params
      params.require(:milestone).permit(:achieved_at, :value, :type_id, :user_id)
    end
end
