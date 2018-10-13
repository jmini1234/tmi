class Like < ActiveRecord::Base
  has_many :users
  belongs_to :post
end
