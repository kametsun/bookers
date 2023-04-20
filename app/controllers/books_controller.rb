class BooksController < ApplicationController

  #データを保存する
  def create
    #データを受け取り新規登録するためのインスタンス作成
    @book = Book.new(book_params)
    #データをDBに保存するためのsaveメソッド実行
    if @book.save
      #フラッシュメッセージ送信
      flash[:notice] = "Book was successfully created."
      #トップ画面へリダイレクト
      redirect_to '/books'
    else 
      render "new"
    end
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
    book.destroy
    redirect_to index_book_path
  end

  def update
    book = Book.find(params[:id])
    book.update(book_params)
    #フラッシュメッセージ送信
    flash[:notice] = "Book was successfully updated."
    redirect_to book_path
  end

  #ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
