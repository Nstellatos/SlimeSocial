class Recipe < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) } #sets default order of recipes retrieved in db (newest to oldest)

  validates :user_id, presence: true
  validates :title, presence: true, length: {maximum: 120}
  validates :description, presence: true, length: {maximum: 260}

end
