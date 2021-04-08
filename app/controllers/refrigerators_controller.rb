class RefrigeratorsController < ApplicationController
  def index
    @refrigerators = Refrigerator.all
  end
  
  def create
    @refrigerator = Refrigerator.new(refrigerator_params)
    if @refrigerator.save
      redirect_to root_path
    else
      render :index
    end
  end

  def destroy
    refrigerator = Refrigerator.find(params[:id])
    refrigerator.destroy
    redirect_to root_path
  end  
    
    private
    
    def refrigerator_params
    params.permit(:foodstuff).merge(user_id: current_user.id)
    end
end
