class BooksController < ApplicationController

  #データを保存する
  def create
    #データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    #データをDBに保存するためのsaveメソッド実行
    if @book.save
      #フラッシュメッセージ送信
      flash[:notice] = "Book was successfully created."
      #詳細画面へリダイレクト
      redirect_to "books/#{@book.id}"
    else
      @books = Book.all
      render :index
    end
  end

  def new

  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
  end


  def edit
    @book = Book.find(params[:id])
  end

  def destroy
    #データを１件取得
    book = Book.find(params[:id])
    #データを削除
    if book.destroy
      #フラッシュメッセージ送信
      flash[:notice] = "Book was successfully destroyed."
      redirect_to index_book_path
    end
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      #フラッシュメッセージ送信
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path
    else
      render :edit
    end
  end

  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
