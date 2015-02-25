class Marketer < ActiveRecord::Base
  has_many :products 
  validates :email, presence: true
end
