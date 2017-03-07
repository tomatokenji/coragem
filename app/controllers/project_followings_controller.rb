class ProjectFollowingsController < ApplicationController
  def index
    @project_followings = ProjectFollowing.all
  end

  def create
    @project_followings = current_user.project_followings.create(params[:id])
    if current_user.save
      flash[:success] = "successfully Followed!"
      redirect_to join_event_path(@project.id)
    else
      flash[:danger] = "There was an error in following."
      render :new
    end
  end
s
  def destroy
    ProjectFollowing.find(params[:id]).delete
    redirect_to project_followings_path
  end

end
