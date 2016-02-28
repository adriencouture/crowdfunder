class Reward < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  # belongs_to :rewardable, polymorphic: true
end
