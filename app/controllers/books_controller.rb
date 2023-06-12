class BooksController < ApplicationController


  def create
    @books = Book.new(books_params)
    @books.user_id = current_user.id
    @books.save
    redirect_to book_path(@books.id)
  end

  def edit

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

  private

  def books_params
    params.require(:book).permit(:title, :body, :image)
  end
end
