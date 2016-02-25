class Project < ActiveRecord::Base
  belongs_to :user
  has_many :rewards


  accepts_nested_attributes_for :rewards, reject_if: :all_blank, allow_destroy: true

def countdown
  startdate = Time.now
   (((self.end_date - startdate).to_i / 60) / 60) / 24
end

def valid_?(end_date)
  self.end_date > Time.now
end

end
