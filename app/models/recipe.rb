class Recipe < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 120}
  validates :description, presence: true, length: {maximum: 260}

end