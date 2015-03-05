class ProjectsController < ApplicationController

  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @projects = Project.all
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      if params[:images]
        params[:images].each { |image|
          @project.photos.create(image: image)
        }
      end
      flash[:notice] = "Your project has been created."
      respond_to do |format|
        format.html { redirect_to @project }
        format.json
      end
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      if params[:images]
        params[:images].each { |image|
          @project.photos.create(image: image)
        }
      end
      flash[:notice] = "Album has been updated."
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to projects_path
  end

  private

  def project_params
    params.require(:project).permit(:name, :description)
  end

  def set_project
    @project = Project.find(params[:id])
  end
end
