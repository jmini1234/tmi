class Bookmark < ActiveRecord::Base
  has_many :users
  belongs_to :post
end
