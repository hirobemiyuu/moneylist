class Coment < ApplicationRecord
  belongs_to :title
  mount_uploader :image, PictureUploader
end
