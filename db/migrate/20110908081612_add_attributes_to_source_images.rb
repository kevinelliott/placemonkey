class AddAttributesToSourceImages < ActiveRecord::Migration
  def change
    add_column :source_images, :content_type, :string
    add_column :source_images, :file_size, :string
  end
end
