class BooksController < ApplicationController
  def create
    book = Book.new(book_params)
    book.save
    
    respond_to do |format|
      if @book.save
        format.html { redirect_to  books_path, notice: 'Book was successfully created.' }
        format.json { render :show, status: :created, location: @book }
      else
        format.html { render :new }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def index
    @books = Book.all
    
    if params[:id].present?
      set_user
    else
      @book = Book.new
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    respond_to do |format|
      if @book.update(user_params)
        format.html { redirect_to request.referer, notice: 'Book was successfully created.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def destroy
  end
  
  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end