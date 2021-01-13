class ImageUploader < CarrierWave::Uploader::Base 

    storage :fog 

end

