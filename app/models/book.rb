class Book < ApplicationRecord
	belongs_to :user
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  
  def self.looks(finders, words)
  	if finders == "forward_match"
      @books = Book.where("title LIKE?","#{words}%")
    elsif finders == "backward_match"
      @books = Book.where("title LIKE?","%#{words}")
    elsif finders == "perfect_match"
      @books = Book.where("title LIKE?","#{words}")
    elsif finders == "partial_match"
      @books = Book.where("title LIKE?","%#{words}%")
    else
      @books = Book.all
    end
  end

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
