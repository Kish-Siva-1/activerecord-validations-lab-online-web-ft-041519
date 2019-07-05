class MyValidator < ActiveModel::Validator
  def validate(record)
    unless record.name.include? ["Won't Believe", "Secret", "Top [number]", "Guess"]
      record.errors[:name] << 'Need a name including X please!'
    end
  end
end


class Post < ActiveRecord::Base
  include ActiveModel::Validations
  
  validates :title, presence: true
  validates(:content, { :length => { :minimum => 250 } })
  validates(:summary, { :length => { :maximum => 250 } })
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

end
