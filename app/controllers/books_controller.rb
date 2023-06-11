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
    @books = Book.new
  end

  def show
    @books = Book.all
  end

  private

  def books_params
    params.require(:book).permit(:title, :body, :image)
  end
end
