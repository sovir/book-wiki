class AppliesController < ApplicationController
	def create
		@chapter = Chapter.find(params[:format])
		@apply = Apply.new
		@apply.chapter_id = @chapter.id
		@apply.owner_id = @chapter.user_id
		@apply.applicant_id = current_user.id
		@apply.status = 0;
		if @apply.save
			redirect_to @chapter
		end
	end

	def index
		@applies = Apply.where({ :owner_id => current_user.id }).all
		@applies_too = Apply.where({:applicant_id=>current_user.id}).all
	end

	##通过
	def show
		@apply = Apply.find(params[:id])
		@apply.update_attribute(:status, 1)
		@chapter = Chapter.find(@apply.chapter_id)
		@user = User.find(@apply.applicant_id)
		if @user.chapters.exists?(@chapter)
			flash[:fail] = "alread has this editor"
		else
			@user.chapters<<@chapter
			flash[:success] = "editor add sucess"
		end
		redirect_to applies_path
	end

	##拒绝
	def edit
		@apply = Apply.find(params[:id])
		@apply.update_attribute(:status, -1)
		redirect_to applies_path
	end
end