class Album < ApplicationRecord
  mount_uploaders :image, ImageUploader
  belongs_to :user
end
