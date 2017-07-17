class UsersController < ApplicationController
  before_action :signed_in_user, only: [:show]
  
  def new
    @user = User.new
  end
  
  def show
    @current_user = current_user
    @list_items = current_user.ticket_list
    @root_tickets = @list_items.find_all{|x| x.is_subticket == false}
  end

   def create
    @user = User.new(user_params)
    if @user.save
      #UserMailer.registration_conformation(@user).deliver
      flash.now[:success] = "Succesfully registrated! Confirm your email"
      redirect_to signin_path
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end
  
  def update
    @user =current_user
    if @user.update_attributes(user_params)
      flash[:success] = "You changed your password succesfully"      
      redirect_to room_path
    end
  end

  def confirm_email
    user = User.find_by_confirm_token(params[:id])
    if user
      user.email_activate
      flash[:success] = "Your account activated"
      redirect_to room_path
    else
      flash[:success] = "User doe not exist"
      redirect_to signin_path
    end
  end
   private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation, :admin)
    end
end
