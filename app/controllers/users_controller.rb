class UsersController < ApplicationController

  def index
    @user_all = User.all
    @user = current_user
    # 全件取得の時はID要らない
    # @user = User.find(params[:id])
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
    #@user = current_user
    @book = Book.new
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end


end
