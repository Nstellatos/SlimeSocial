class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredients, through: :recipe_ingredients
  
  default_scope -> { order(created_at: :desc) } #sets default order of recipes retrieved in db (newest to oldest)

  accepts_nested_attributes_for :recipe_ingredients, :reject_if => :all_blank, :allow_destroy => true


  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 120}
  validates :description, presence: true, length: {maximum: 260}
  
  
  has_attached_file :recipe_img, styles: { recipe_index: "250x350>", recipe_show: "325x475>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :recipe_img, content_type: /\Aimage\/.*\z/

  
end
