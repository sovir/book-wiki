class  LovedBooksController < ApplicationController
	before_filter :signed_in_user, only: [:create, :destroy]	
	before_filter :correct_user,   only: :destroy
	def index
		@loved_books = LovedBook.paginate(page: params[:page]) 
	end
	
	def create
		@loved_book = current_user.loved_books.build(params[:loved_book])
    if @loved_book.save
      flash[:success] = "Book created!"
      redirect_to current_user
    else
      render 'static_pages/home'
    end
	end

	def destroy
		@loved_book.destroy
    		redirect_to current_user
	end

	def show
		@loved_book = LovedBook.find(params[:id])
		@chapters = @loved_book.chapters
		session[:book_id] = @loved_book.id
	end

	private
    def correct_user
      @loved_book = current_user.loved_books.find_by_id(params[:id])
      redirect_to root_url if @loved_book.nil?
    end
end
