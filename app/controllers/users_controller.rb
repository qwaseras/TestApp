class UsersController < ApplicationController
  before_action :signed_in_user, only: [:show]
  before_action :correct_user,   only: [:show]  
  
  def new
    @user = User.new
  end
  
  def show
    @current_user = current_user
    @list_items = current_user.ticket_list
  end

   def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash.now[:success] = "Succesfully registrated!"
      redirect_to @user
    else
      render 'new'
    end
  end

   private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :admin)
    end
end
