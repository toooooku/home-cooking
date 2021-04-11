class RefrigeratorsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @refrigerators = Refrigerator.all.includes(:user).order("created_at DESC")
  end
  
  def create
    refrigerator = Refrigerator.new(refrigerator_params)
    if refrigerator.save
      render json: {refrigerator: refrigerator}
    end  
  end

  def destroy
    refrigerator = Refrigerator.find(params[:id])
    refrigerator.destroy
    redirect_to refrigerators_path
  end  
    
  private
  def refrigerator_params
    params.permit(:foodstuff).merge(user_id: current_user.id)
  end
end
