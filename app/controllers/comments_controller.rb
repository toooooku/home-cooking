class CommentsController < ApplicationController
  def create
    if comment = Comment.create(comment_params)
      redirect_to "/recipes/#{comment.recipe.id}"
    else
      @recipe = @comment.recipe
      @comments = @recipe.comments
      render "recipes/show"
    end    
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, recipe_id: params[:recipe_id])
  end
end
