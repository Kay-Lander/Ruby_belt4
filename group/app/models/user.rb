class User < ActiveRecord::Base
  has_secure_password

  has_many :orgs, dependent: :destroy
  has_many :followers, dependent: :destroy
  has_many :groups, through: :followers, source: :org

  before_save :downcase_g

  validates :first_name, :last_name, presence: true, length: 2..100
  validates_format_of :first_name, :last_name, with: /\A[-a-z]+\Z/i
  validates :email, presence: true, uniqueness: true
  validates :password, length: 4..26

  def downcase_g
    self.first_name.downcase!
    self.last_name.downcase!
    self.email.downcase!
  end
end
