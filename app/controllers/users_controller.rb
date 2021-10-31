class UsersController < ApplicationController
    before_action :correct_user,only: [:edit,:update]

  def index
    @users = User.all
    @user = current_user
    @book = Book.new

  end

  def show
    @user = User.find(params[:id])
    @book = Book.new
    @books = @user.books
  end

  def new
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])

  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "User was successfully updated."
    redirect_to user_path(@user.id)

    else
      render :edit
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    if user.destroy
      flash[:notice] = "Signed out successfully."
    redirect_to root_path
    else
    end
  end

  def correct_user
    @user = User.find(params[:id])
    unless @user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end

