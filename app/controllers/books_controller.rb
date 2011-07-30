class BooksController < ApplicationController
  def index
    @books = Book.where(:checked_out => false)
  end

  def checked_out
    @books = Book.where(:checked_out => true)
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
