class RecipesController < ApplicationController
    before_action :logged_in_user, only: [:index, :show, :new, :create, :destroy]
    before_action :correct_user, only: [:edit, :update, :destroy]

    def index 
        @recipes = Recipe.paginate(page: params[:page])
    end

    def show 
        @recipe = Recipe.find(params[:id])
    end 

    def new
        @recipe = Recipe.new
        @recipe.recipe_ingredients.build.build_ingredient
    end



    def create 
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save 
            flash[:success] = "Recipe created"
            redirect_to @recipe
        else
            render 'new'
            # @slime_recipes = []
            # current_user.slimes.paginate(page: params[:page])
            # render 'static_pages/home'
        end
    end

    def edit 
    end

    def update
        if @recipe.update(recipe_params)
            redirect_to recipe_path(@recipe)
        else
            render 'edit'
        end
    end


    def destroy
        @recipe.destroy 
        flash[:success] = "slime deleted"
        redirect_to root_url 
    end

    

    private 

    def recipe_params 
        params.require(:recipe).permit(:title, :description, :recipe_img, 
            recipe_ingredients_attributes: [:id, :ingredient_name, :_destroy], steps_attributes:[:id, :direction, :_destroy])
    end 

    def correct_user 
        @recipe = current_user.recipes.find_by(id: params[:id])
        redirect_to root_url if @recipe.nil?
    end
end
