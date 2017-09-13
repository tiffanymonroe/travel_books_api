class BooksController < ApplicationController
  before_action :set_book, only: [:show]
  #gets error if running this line of code:
  # before_action :authorize_user, except: [:index, :show, :create]

  # GET /books
  def index
    @books = Book.all
    render json: @books

  end

  # GET /books/1
  def show
    render json: @book
  end

  # POST /books
  def create
    @book = Book.new(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])


    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:title, :author, :isbn, :genre, :user_id)
    end
end
