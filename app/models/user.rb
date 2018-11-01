class User < ActiveRecord::Base
  acts_as_token_authenticatable
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookmarks
  has_many :posts
  has_many :comments

  def is_Bookmark?(post)
     Bookmark.find_by(user_id: self.id, post_id: post.id).present?
 end



end
