class LovedBook < ActiveRecord::Base
  attr_accessible :book_description, :book_name
	belongs_to	:user
	has_many	:chapters, dependent: :destroy

	validates	:user_id,	presence:	true
	validates	:book_name, presence: true, length: { maximum: 40}
	default_scope	order: 'loved_books.created_at DESC'
end
