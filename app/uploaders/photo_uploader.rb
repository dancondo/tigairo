class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::RMagick # <- Notice this

  storage :fog                    # <- and this

  version :large do
    resize_to_limit(600, 600)
  end

  version :thumb do
    process :crop
    resize_to_fill(400, 400)
  end

  version :large_thumb do
    process :crop
    resize_to_fill(1200, 1200)
  end

  def crop
    if model.crop_x.present?
      resize_to_limit(1200, 1200)
      manipulate! do |img|
        x = model.crop_x.to_i * 2
        y = model.crop_y.to_i * 2
        w = model.crop_w.to_i * 2
        h = model.crop_h.to_i * 2
        img.crop!(x, y, w, h)
      end
    end
  end
end
