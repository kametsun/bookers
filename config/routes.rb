Rails.application.routes.draw do
  #説明ページ？（https://bookers-level1.herokuapp.com/）
  get 'homes/top'
  #トップ画面(Booksの)
  get 'books' => 'books#index', as: 'index_book'
  #データ追加ルーティング
  post 'books' => 'books#create'
  #投稿一覧画面
  get 'books/:id' => 'books#show'

  get 'books/detail'

  patch 'books/:id' => 'books#update', as: 'update_book'
  #投稿編集画面
  get 'books/:id/edit' => 'books#edit', as: 'edit_book'
  #投稿詳細画面
  get 'books/:id' => 'books#show', as: 'book'

  delete 'books/:id' => 'books#destroy', as: 'destroy_book'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
