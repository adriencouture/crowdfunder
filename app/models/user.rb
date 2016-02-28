class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :rewards, through: :projects
  has_many :projects
  has_many :tags, as: :taggable

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes["password"] }
  validates :password, confirmation: true, if: -> { new_record? || changes["password"] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes["password"] }

  validates :email, uniqueness: true
end
