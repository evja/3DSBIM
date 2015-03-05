class Project < ActiveRecord::Base
  has_many :photos
  mount_uploader :image, ImageUploader
end
