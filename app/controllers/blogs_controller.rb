class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end  

  def create
    @blog = Blog.new(blog_params)
      if @blog.save
        redirect_to root_path
      else
        render :new
      end  
  end

  def show
    @blog = Blog.find(params[:id])
  end  
  
  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to root_path
  end  

  private

  def blog_params
    params.require(:blog).permit(:title, :start_time, :content).merge(user_id: current_user.id)
  end
end
