class Recipe < ApplicationRecord
  belongs_to :user
  has_many_attached :image
  default_scope -> { order(created_at: :desc) } #sets default order of recipes retrieved in db (newest to oldest)

  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 120}
  validates :description, presence: true, length: {maximum: 260}
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png], 
    message: "must be a valid image format"},
    size: {less_than: 5.megabytes,
    message: "should be less than 5MB" }

    #returns a resized image
    def display_image
      image.variant(resize_to_limit: [500, 500])
    end
end
