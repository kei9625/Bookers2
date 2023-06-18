class BooksController < ApplicationController


  def create
    @books = Book.new(books_params)
    @books.user_id = current_user.id
    if @books.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@books.id)
  end

  def edit
    @books = Book.find(params[:id])
    flash[:notice] = "You have updated book successfully."
    @user = current_user
  end

  def update
    @books = Book.find(params[:id])
    @books.update(books_params)
    redirect_to book_path(@books.id)
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    #@books = Book.all
    @user = current_user
    @book = Book.new
    @books = Book.find(params[:id])
  end

  def destroy
    @books = Book.find(params[:id])
    @books.destroy
    redirect_to books_path

  end

  private

  def books_params
    params.require(:book).permit(:title, :body, :image)
  end
end
