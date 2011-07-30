class BooksController < ApplicationController
  def index
    @books = Book.checked_in.paginate(:page => params[:page], :per_page => 10)
  end

  def checked_out
    @books = Book.checked_out.paginate(:page => params[:page], :per_page => 10)
    render :index
  end

  def search
    @books = Book.order("publish_year")
    @books = @books.search(params[:query]) if params[:query].present?
    render :index
  end

  def show
    @book = Book.find(params[:id])
  end

  def new
    @book = Book.new
  end

  def edit
    @book = Book.find(params[:id])
  end

  def create
    @book = Book.new(params[:book])
    if @book.save
      redirect_to @book
    else
      render :new
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update_attributes(params[:book])
      redirect_to @book
    else
      render :edit
    end
  end

  def check_out
    @book = Book.find(params[:id])
    @book.update_attribute(:checked_out, true)
    redirect_to :back
  end

  def check_in
    @book = Book.find(params[:id])
    @book.update_attribute(:checked_out, false)
    redirect_to :back
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to :books
  end
end
