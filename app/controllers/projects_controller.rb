class ProjectsController < ApplicationController

  def show
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.build(project_params)
    if @project.save
      respond_to do |format|
        format.html redirect_to @project
        format.json
      end
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      respond_to do |format|
        format.html redirect_to @project
        format.json
      end
    else
      render :edit
    end
  end

  def destroy
    @project.delete
    redirect_to @projects
  end

  private

  def project_params
    params.require(:project).permit(:name, :desription)
  end
end
