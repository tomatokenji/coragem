class ProjectsController < ApplicationController

  def index
    @projects = Project.All
  end

  def new
    @project = current_user.projects.new
    @project_photo = ProjectPhoto.new
  end

  def create
    @project = current_user.projects.new(project_params)

      if @project.save
        flash[:success] = "Project saved successfully!"
        if params[:commit]=="Save Project"
          redirect_to "/projects/confirm/" + @project.id.to_s
        else
          redirect_to edit_project_path
        end
      else
        flash[:danger] = "There was an error in saving the project"
        render :new
      end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    p = Project.find(params[:id])
    p.update(project_params)
    redirect_to project_path
  end

  def destroy
    Project.find(params[:id]).delete
    redirect_to projects_path
  end

  #only for the creator to edit
  def confirm
    @project =Project.find(params[:id])

    if (current_user.id != @project.user_id || !current_user.admin)
      flash[:danger] = "you are not authorized to view this page!"
      redirect_to(:back)
    else
      render :confirm
    end
  end

  def confirmed
    p=Project.find(params[:id])
    if params[:commit]=="Edit Project"
      redirect_to edit_project_path

    elsif params[:commit]=="Submit Project"
      p.update(status_project_id: 2)
      redirect_to project_path(p)
    end
  end

  private

  def project_params
    params.require(:project).permit(
      :name,
      :description,
      :skills_needed,
      :approved,
      :approver_id,
      :benefits,
      :resources_needed,
      :project_file,
      :project_profile_picture,
      :project_proposal,
      :objectives,
      :talents_needed,
    )
  end

end
