class ProjectsController < ApplicationController

  def index
    @projects = Project.All
  end

  def new
    @project = current_user.projects.new
  end

  def create
    @project = current_user.projects.new(project_params)

    if @project.save
      flash[:success] = "Event created successfully!"
      redirect_to join_event_path(@event.id)
    else
      flash[:danger] = "There was an error creating the event."
      render :new
    end
  end

  def show
    @project = Tweet.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    p = Project.find(params[:id])
    p.update(project_params)
    redirect_to projects_path
  end

  def destroy
    Project.find(params[:id]).delete
    redirect_to projects_path
  end

  def project_params
    params.require(:project).permit(
      :name,
      :description,
      :skills_needed,
      :approved,
      :approver_id,
      :benefits,
      :resources_needed
    )
  end

end
