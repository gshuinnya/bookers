class BooksController < ApplicationController
	def top
  end
  def index
    @books = Book.all.order("id ASC")
    @book = Book.new
  end

  def create
    book = Book.new(book_params)
    if book.save
    flash[:success] = "successfully"
    redirect_to book_path(book)
    else
    flash[:blank] = "error"
    redirect_to books_path
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    flash[:success] = "successfully" if book.update(book_params)
    redirect_to book_path(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:destroy] = 'successfully'
    redirect_to books_path
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
