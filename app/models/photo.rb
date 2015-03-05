class Photo < ActiveRecord::Base
  belongs_to :projects
  mount_uploader :image, ImageUploader
end
