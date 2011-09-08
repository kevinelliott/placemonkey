class SourceImage < ActiveRecord::Base
  mount_uploader :image, SourceImageUploader
  before_save :update_image_attributes
  
  private

  def update_image_attributes
   if image.present? && image_changed?
     self.content_type = image.file.content_type
     self.file_size = image.file.size
   end
  end
end
