class Project < ActiveRecord::Base
  has_many :rewards
  belongs_to :user

  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

def countdown
  Time.now.mday - end_date.mday
end

end
