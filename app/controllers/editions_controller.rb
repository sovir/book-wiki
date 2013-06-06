class EditionsController < ApplicationController
	def show
		@edition = Edition.find(params[:id])
		@chapter = Chapter.find(@edition.chapter_id)
		@chapters = @chapter.chapters
		@editions = @chapter.editions
		@lasteditor = User.find(@edition.user_id)
	end
	def destroy
		@edition = Edition.find(params[:id])
		@chapter = Chapter.find(@edition.chapter_id)
		@edition.destroy
		File.delete(Rails.root.join('edition')+"#{params[:id]}.md")
		redirect_to @chapter
	end
	def update
		@edition = Edition.find(params[:id])
		@edition = Edition.find(params[:id])
		text = File.read(Rails.root.join('edition')+"#{@edition.id}.md")
		@chapter = Chapter.find(@edition.chapter_id)
		if @chapter.update_attributes(params[:chapter])
			flash[:success] = "back success"
			File.open(Rails.root.join('chapter')+"#{@chapter.id}.md", "w:utf-8") do |write_stream|
      			write_stream.write text
      		end
			redirect_to @chapter
		end
	end
end