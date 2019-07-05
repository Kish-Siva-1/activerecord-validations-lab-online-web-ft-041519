class Post < ActiveRecord::Base
  validates :title, presence: true
  validates(:content, { :length => { :minimum => 250 } })
  validates(:summary, { :length => { :maximum => 250 } })
  validates :size, inclusion: { in: %w(small medium large),
    message: "%{value} is not a valid size" }
end
