class Bookmark < ActiveRecord::Base
  has_many :users
  has_many :post
end
