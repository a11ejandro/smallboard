# == Schema Information
#
# Table name: posts
#
#  id          :integer          not null, primary key
#  title       :string(255)
#  city        :string(255)
#  content     :text
#  picture     :string(255)
#  email       :string(255)
#  address     :string(255)
#  user_id     :integer
#  category_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Post < ActiveRecord::Base
  attr_accessible :address, :category_id, :city, :content, :email, :picture, :title, :user_id
  
  belongs_to :user
  belongs_to :category
  attr_accessible :address, :city, :content, :email, :picture, :title
  validates :address, :length => {:minimum => 5, :maximum => 254}
  validates :email,   :presence => true
                      
  validates :content, :presence => true
  validates :title,   :length => {:minimum => 3, :maximum => 254}
end
