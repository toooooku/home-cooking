class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end
  
  def create
    @recipe = Recipe.new(recipe_params)
      if @recipe.save
        redirect_to root_path
      else
        render :new
      end  
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def edit

  end
  
  def update

  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :cooking_recipe, :image).merge(user_id: current_user.id)
  end
end

