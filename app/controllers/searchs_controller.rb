class SearchsController < ApplicationController
  def search
    @range = params[:range]
    @word = params[:word]
    if @range == "User"
      @users = User.looks(params[:finder], params[:word])
    else
      @books = Book.looks(params[:finder], params[:word])
    end
  end
end
