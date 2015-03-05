class PhotosController < ApplicationController
  before_action :set_project
  before_action :set_photo, only: [:show, :edit, :update, :destroy]

  def show
  end

  def index
    @photos = Photo.all
  end

  def new
    @photo = @project.photos.new
  end

  def create
    @photo = @project.photos.new(photo_params)
    if @photo.save
      redirect_to @project
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @photo.update(photo_params)
      redirect_to @project
    else
      render :edit
    end
  end

  def destroy
    @photo.destroy
    redirect_to @project
  end


    def set_project
      @project = Project.find(params[:project_id])
    end

    def set_photo
      @photo = Photo.find(params[:id])
    end

    def photo_params
      params.require(:photo).permit(:name, :description, :project_id, :image)
    end
end
