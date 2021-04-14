class RecipesController < ApplicationController
  before_action :authenticate_user!, only: [:new, :show, :search]

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
    @comment = Comment.new
    @comments = @recipe.comments.includes(:user)
  end

  def edit
    @recipe = Recipe.find(params[:id])
    unless @recipe.user_id == current_user.id
      redirect_to action: :index
    end  
  end
  
  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      redirect_to recipe_path
    else
      render :edit
    end    
  end

  def destroy
    recipe = Recipe.find(params[:id])
    recipe.destroy
    redirect_to root_path
  end  

  def search
    @recipes = Recipe.search(params[:keyword])
  end

  private

  def recipe_params
    params.require(:recipe).permit(:title, :cooking_recipe, :image).merge(user_id: current_user.id)
  end  
end


