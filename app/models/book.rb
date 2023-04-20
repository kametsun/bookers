class Book < ApplicationRecord
  #タイトルが必須
  validates :title,
    presence: true

  #感想が必須
  validates :body,
    presence: true

end
