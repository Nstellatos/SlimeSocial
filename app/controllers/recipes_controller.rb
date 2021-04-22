class RecipesController < ApplicationController
    before_action :logged_in_user, only: [:index, :new, :create, :destroy]
    before_action :correct_user, only: [:destroy]

    def index 
        @recipes = Recipe.paginate(page: params[:page])
    end

    def new
        @recipe = Recipe.new
        @recipe.recipe_ingredients.build.build_ingredient
    end

    def create 
        @recipe = current_user.recipes.build(recipe_params)
        @recipe.image.attach(params[:recipe][:image])
        if @recipe.save 
            flash[:success] = "Recipe created"
            redirect_to root_path
        else
            @slime_recipes = []
            current_user.slimes.paginate(page: params[:page])
            render 'static_pages/home'
        end
    end

    def destroy
        @recipe.destroy 
        flash[:success] = "slime deleted"
        redirect_to root_url 
    end

    

    private 

    def recipe_params 
        params.require(:recipe).permit(:title, :description, :image, 
            recipe_ingredients_attributes: [:id, :ingredient_name, :_destroy])
    end 

    def correct_user 
        @recipe = current_user.recipe.find_by(id: params[:id])
        redirect_to root_url if @recipe.nil?
    end
end
