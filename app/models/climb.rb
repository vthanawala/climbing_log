class Climb < ApplicationRecord
  mount_uploader :picture, PictureUploader

  # Direct associations

  belongs_to :location,
             :required => false,
             :counter_cache => true

  belongs_to :user,
             :counter_cache => true

  # Indirect associations

  # Validations

end
