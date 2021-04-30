class Review < ApplicationRecord
    belongs_to :recipe, dependent: :destroy
    belongs_to :user 

    validates :rating, presence: true

  
end
