class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  has_one_attached :image
  default_scope -> { order(created_at: :desc) } #sets default order of recipes retrieved in db (newest to oldest)

  accepts_nested_attributes_for :recipe_ingredients, :reject_if => :all_blank, :allow_destroy => true


  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 120}
  validates :description, presence: true, length: {maximum: 260}
  validates :image, content_type: { in: %w[image/jpeg image/gif image/png], 
    message: "must be a valid image format"},
    size: {less_than: 5.megabytes,
    message: "should be less than 5MB" }

    #returns a resized image
    def display_image
      image.variant(resize_to_limit: [300, 300])
    end
end
