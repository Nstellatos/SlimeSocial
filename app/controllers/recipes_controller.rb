class RecipesController < ApplicationController
    before_action :authenticate_user!, only: [:create, :new, :edit, :destroy]

    
    def new 
        @recipe = current_user.recipes.build
    end
    
    def create 
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save 
            flash[:success] = "Recipe created"
            redirect_to root_path
        else
            render 'new'
        end
    end

    

    private 

    def recipe_params 
        params.require(:recipe).permit(:title, :description)
    end 











end
