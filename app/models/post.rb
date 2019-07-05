class Post < ActiveRecord::Base
  validates :title, presence: true
  validates(:short_content, { :length => { :minimum => 250 } })

end
