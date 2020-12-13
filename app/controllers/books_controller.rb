class BooksController < ApplicationController

  def index
    @books = Book.all
    @book = Book.new
  end

  # def new

  # end

  def create
    @book = Book.new(book_params)
    if @book.save
      # flash[:success] = "Book OK"
      redirect_to book_path(@book), notice: "Book was successfully created."
    else
      @books = Book.all
      render("books/index")
    end
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)


      # redirect_to book_path(book.id)
       redirect_to book_path(@book.id), notice: "Book was successfully updateted."
    else


     render("books/edit")

    # <やりたいこと>
    # もしデータがセーブされなかった場合の処理
    # 1.バリデーションエラーを返す
    # 2.編集画面を表示

    #<疑問点>
    #・renderでshow.htmlに返してhtml側で処理を分岐するべきかもしくはerror.htmlを作成して別途処理を描くべきか
    #・そもそも上記のロジックであっているか


    # ここのあとの処理が分かりません
    # 更新処理後どのように編集画面に行けば良いかまたどのような処理を描くべきか

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
