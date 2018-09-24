class BooksController < ApplicationController

def index
  @book = Book.new
  @books = Book.page(params[:page]).reverse_order
end

def show
  @book = Book.find(params[:id])
  @book2 = Book.new
  @books = Book.new
end

def create
  @book = Book.new(book_params)
  @book.user_id = current_user.id
  if @book.save
    redirect_to user_path(current_user.id), notice: "Book was successfully created."
  else
    @books = Book.page(params[:page]).reverse_order
  	render :index
  end
end

def edit
  @book = Book.find(params[:id])
  if current_user.id != @book.user.id
    redirect_to user_path(current_user.id)
  end
end

def update
  book = Book.find(params[:id])
  book.update(book_params)
  redirect_to book_path(book.id), notice: "Book was successfully modified."
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


