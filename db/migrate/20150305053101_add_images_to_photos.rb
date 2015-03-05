class AddImagesToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :images, :json
  end
end
