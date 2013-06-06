class StaticPagesController < ApplicationController
  def home
  	@loved_book = current_user.loved_books.build if signed_in?
	end

  def help
  end

  def about
  end

def contact
end
end
