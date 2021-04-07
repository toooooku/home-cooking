class RecipesController < ApplicationController
  def index
  end




  private

  def recipe_params
    params.require(:recipe).permit(:title, :image).merge(user_id: current_usre.id)
end
