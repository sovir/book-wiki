class Edition < ActiveRecord::Base
  attr_accessible :user_id #最后修改者
  belongs_to	:chapter
  has_one	:user
  validates	:user_id,	presence:	true
  validates :chapter_id, presence: true 
end
