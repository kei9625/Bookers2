class BooksController < ApplicationController


  def create
    @book = Book.new(books_params)
    @book.user_id = current_user.id
    if @book.save
    flash[:notice] = "You have created book successfully."
    redirect_to book_path(@book.id)
    else
      @books = Book.all
      @user = current_user
      render :index
    end
  end

  def edit
    @books = Book.find(params[:id])
    flash[:notice] = "You have updated book successfully."
    @user = current_user
  end

  def update
    @books = Book.find(params[:id])
    if @books.update(books_params)
    redirect_to book_path(@books.id)
    else
      render :edit
    end
  end

  def index
    @user = current_user
    @book = Book.new
    @books = Book.all
  end

  def show
    #@books = Book.all
    @book = Book.new
    @books = Book.find(params[:id])
    @user = @books.user
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
