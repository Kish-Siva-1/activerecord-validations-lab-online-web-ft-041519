class Post < ActiveRecord::Base
  validates :title, presence: true
  validates(:short_content, { :length => { :minimum => 10 } })
  validates :name, uniqueness: true
end
