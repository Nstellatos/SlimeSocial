class StaticPagesController < ApplicationController
  def home
    if logged_in?
   @recipe = current_user.recipes.build
   @slime_recipes = current_user.slimes.paginate(page: params[:page])
    end
  end
end
