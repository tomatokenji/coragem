class ProjectsController < ApplicationController

  def index
    @projects = Project.All
  end

  def new
    @project = Project.new
  end

  def create
    Project.create(project_params)
  end

  def show
    @tweet = Tweet.find(params[:id])
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
    params.require(:project).permit(:name,:description)
  end

end
