class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick # <- Notice this

  storage :fog                    # <- and this

  version :large do
    resize_to_limit(600, 600)
  end

  version :thumb do
    process :crop
    process :auto_orient
    resize_to_fill(400, 400)
  end

  version :large_thumb do
    process :crop
    process :auto_orient
    resize_to_fill(600, 600)
  end

  def crop
    if model.crop_x.present?
      resize_to_limit(600, 600)
      manipulate! do |img|
        x = model.crop_x.to_i
        y = model.crop_y.to_i
        w = model.crop_w.to_i
        h = model.crop_h.to_i
        img.crop!(x, y, w, h)
      end
    end
  end

  def auto_orient
    manipulate! do |img|
      img = img.auto_orient
    end
  end

end
