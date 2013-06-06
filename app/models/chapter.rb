class Chapter < ActiveRecord::Base
  attr_accessible  :content, :name,	:description, :processing, :deadline, :user_id
	belongs_to	:loved_book
	belongs_to	:chapter
	has_many	:chapters,	dependent:	:destroy
	has_many 	:editions,	dependent: 	:destroy
	has_and_belongs_to_many	:users
	validates	:content, presence: true
end
