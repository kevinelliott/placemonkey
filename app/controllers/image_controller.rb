class ImageController < ApplicationController
  def index
    width = params[:width]
    height = params[:height]
    
    if width && height
      offset = rand(SourceImage.count)
      random_source_image = SourceImage.first(:offset => offset)
      image = Magick::Image.from_blob(open(random_source_image.image.url, "rb").read).first
      resized_image = image.resize_to_fill(width.to_i, height.to_i)
    end
    
    respond_to do |format|
      if (width && height && random_source_image)
        format.html {
          response.headers['Content-Type'] = 'image/jpeg'
          response.headers['Content-Disposition'] = 'inline'
          render :text => resized_image.to_blob
        }
      else
        format.html { redirect_to root_path }
      end
    end
  end
end
