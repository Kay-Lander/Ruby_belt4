class Org < ActiveRecord::Base
  belongs_to :user, required: true

  has_many :followers, dependent: :destroy
  has_many :fam_followers, through: :followers, source: :user

  validates :name, :description, presence: true
  validates :name, length: 5..100
  validates :description, length: 10..100

end
