class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorite_recipes = current_user.favorite_recipes
  end

  def create
    @recipe = Recipe.find(params[:recipe_id])
    current_user.favorites.create(recipe: @recipe)
    redirect_to recipes_path, notice: "Added to cookbook!"
  end

  def destroy
    @favorite = current_user.favorites.find(params[:id])
    if @favorite
      @favorite.destroy
      # Redirect to the previous page that made the request or to the recipes index
      redirect_to request.referer || recipes_path, notice: "Recipe removed from cookbook!"
    else
      redirect_to recipes_path, alert: "Cookbook not found."
    end
  end
end
