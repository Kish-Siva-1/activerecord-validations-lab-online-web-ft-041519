class Post < ActiveRecord::Base
  validates :title, presence: true
  validates(:phone_number, { :length => { :minimum => 10 } })
  validates :name, uniqueness: true
end
