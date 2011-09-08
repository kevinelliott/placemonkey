class CreateSourceImages < ActiveRecord::Migration
  def change
    create_table :source_images do |t|
      t.string :image

      t.timestamps
    end
  end
end
