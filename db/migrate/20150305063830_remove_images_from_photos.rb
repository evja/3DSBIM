class RemoveImagesFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :images, :json
  end
end
