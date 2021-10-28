class BooksController < ApplicationController
before_action :authenticate_user!
 def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully create."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index

    end
  end

  def index
    @books = Book.all
    @book = Book.new

  end

  def show
    @booknew = Book.new
    @book = Book.find(params[:id])
    @uaer = User.new
    @users = @books

  end

  def edit
    @book = Book.find(params[:id])

  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully updated."
    redirect_to book_path(@book.id)
    else render :book_path
    end

  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end