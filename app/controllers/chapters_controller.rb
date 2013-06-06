class ChaptersController < ApplicationController
	def create
		if session[:book_id] != nil
			@loved_book = LovedBook.find(session[:book_id])
			@chapter = @loved_book.chapters.build(params[:chapter])#新建章节
			if @chapter.save
				@chapter.update_attribute(:user_id, current_user.id)
				flash[:success] = "success add a chapter for book:"+@loved_book.book_name
				session[:book_id] = nil
				File.open(Rails.root.join('chapter')+"#{@chapter.id}.md", "w:utf-8") do |write_stream|
      				write_stream.write @chapter.content
      			end
				current_user.chapters<<@chapter
				@edition = @chapter.editions.create("user_id"=>current_user.id)
				File.open(Rails.root.join('edition')+"#{@edition.id}.md", "w:utf-8") do |f|
      				f.write @chapter.content
      			end
				redirect_to @loved_book
			else
				render 'new'
			end
		else
			@chapter = Chapter.find(session[:chapter_id]).chapters.build(params[:chapter])
			if @chapter.save
				@chapter.update_attribute(:user_id, current_user.id)
				flash[:success] = "success add a chapter for chapter:"+Chapter.find(session[:chapter_id]).name
				session[:chapter_id]=nil
				current_user.chapters<<@chapter
				File.open(Rails.root.join('chapter')+"#{@chapter.id}.md", "w:utf-8") do |write_stream|
      					write_stream.write @chapter.content
      			end
      			@edition = @chapter.editions.create("user_id"=>current_user.id)
				File.open(Rails.root.join('edition')+"#{@edition.id}.md", "w:utf-8") do |f|
      				f.write @chapter.content
      			end
				redirect_to Chapter.find(@chapter.chapter_id)
			else
				render 'new'
			end
		end
	end
	
	def new
		if session[:book_id] != nil
			@chapter = LovedBook.find(session[:book_id]).chapters.build(params[:chapter])
		else
			@chapter = Chapter.find(session[:chapter_id]).chapters.build(params[:chapter])
		end
	end
	
	def destroy
		Chapter.find(params[:id]).destroy
		File.delete(Rails.root.join('chapter')+"#{params[:id]}.md")
		redirect_to current_user
	end

	def show
		session[:book_id]=nil
		session[:chapter_id] = params[:id]
		@chapter = Chapter.find(params[:id])
		@chapters = @chapter.chapters	
		@editor = User.new
		@editors = @chapter.users
		@editions = @chapter.editions
	end

	def edit
		@chapter = Chapter.find(params[:id])
    end

	def update
		@chapter = Chapter.find(params[:id])
		if @chapter.update_attributes(params[:chapter])
			flash[:success] = "update success"
			File.open(Rails.root.join('chapter')+"#{@chapter.id}.md", "w:utf-8") do |write_stream|
      			write_stream.write @chapter.content
      		end
      		@edition = @chapter.editions.create("user_id"=>current_user.id)
			File.open(Rails.root.join('edition')+"#{@edition.id}.md", "w:utf-8") do |f|
      			f.write @chapter.content
      		end
			redirect_to @chapter
		else
			render 'edit'
		end
	end

	def addeditor
		@user = User.find(params[:user][:id])
		@chapter = Chapter.find(session[:chapter_id])
		if @user.chapters.exists?(@chapter)
			flash[:fail] = "alread has this editor"
		else
			@user.chapters<<@chapter
			flash[:success] = "editor add sucess"
		end
		redirect_to @chapter
	end
end