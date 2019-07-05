class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.title.match Regex.union(["Won't Believe", "Secret", "Top [number]", "Guess"])
      record.errors[:title] << 'Need a name including X please!'
    end

  end
end


class Post < ActiveRecord::Base
  include ActiveModel::Validations

  validates :title, presence: true
  validates(:content, { :length => { :minimum => 250 } })
  validates(:summary, { :length => { :maximum => 250 } })
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates_with MyValidator

end
