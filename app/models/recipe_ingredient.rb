class RecipeIngredient < ApplicationRecord
    belongs_to :ingredient
    belongs_to :recipe

    accepts_nested_attributes_for :ingredient, :reject_if => :all_blank, :allow_destroy => true


    def ingredient_name
      self.ingredient.name if !self.id.nil?
    end

    def ingredient_name=(name)
        @ingredient = Ingredient.find_or_create_by(name: name)
        self.ingredient = @ingredient
      end


  #   def ingredient_attributes=(ingredient_attributes)
  #     ingredient_attributes.values.each do |i|
  #         if i != ""
  #             ingredient = Ingredient.find_or_create_by(name: i.downcase)
  #             self.ingredient = ingredient
  #         end 
  #     end 
  # end
end

    # def ingredient_name
    #     self.ingredient.name if !self.id.nil?
    #   end
    
      
