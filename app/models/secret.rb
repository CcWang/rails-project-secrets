class Secret < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  # rename users to users_like, source means from which model
  has_many :users_liked, through: :likes, source: :user
  validates :content, presence:true
end
