class ProjectPhotosController < ApplicationController

  def create
    @project_photo = ProjectPhoto.create(project_photo_params)

  end

  def project_photo_params
    params.require(:project).permit(
      :project_photo,
      :project_id
    )
  end
end
