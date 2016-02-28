require 'date'

class Project < ActiveRecord::Base
  has_many :rewards
  belongs_to :user
  has_many :tags, as: :taggable
  # has_many :rewards, as: :rewardable

  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

def countdown
  startdate = Time.now
   (((self.end_date - startdate).to_i / 60) / 60) / 24
end

end
