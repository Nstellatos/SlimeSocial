# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) 
        User
            has_many :recipes
            has_many :reviews
        Recipe
            has_many :recipe_ingredients
            has_many :steps
            has_many :reviews
        Ingredient
            has_many :recipe_ingredients
- [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
        Recipe
            belongs_to :user
        Step
            belongs_to :recipe
        RecipeIngredient
            belongs_to :recipe
            belongs_to :ingredient
        Review
            belongs_to :user
            belongs_to :recipe
- [x] Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients)
        Ingredient
            has_many :recipes, through: :recipe_ingredients
        Recipe
          has_many :ingredients, through: :recipe_ingredients

- [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients)
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity)
            recipe_ingredients.name

- [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item)
        prescense, uniqueness, length, format


- [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes)
        Model: User
            def slimes
                Recipe.where("user_id = ?", id)
            end  


- [x] Include signup (how e.g. Devise)
- [x] Include login (how e.g. Devise)
- [x] Include logout (how e.g. Devise)
- [x] Include third party signup/login (how e.g. Devise/OmniAuth)
        facebook signup/login
- [x] Include nested resource show or index (URL e.g. users/2/recipes)
            recipes do
                reviews
- [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
            recipes/1/reviews/new


- [x] Include form display of validation errors (form URL e.g. /recipes/new)
        specific partial for error messages
            views/shared/_error_messages.html.erb

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate