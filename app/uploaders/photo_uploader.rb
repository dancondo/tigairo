class PhotoUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick # <- Notice this

  storage :fog                    # <- and this

  version :avatar do
    resize_to_fill 50, 50
  end

  version :standard do
    resize_to_fill 400, 300
  end

  version :thumb do
    resize_to_fill 100, 100
  end
end
