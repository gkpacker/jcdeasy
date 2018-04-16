class ArtUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
