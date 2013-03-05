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

require 'spec_helper'

describe Post do
  pending "add some examples to (or delete) #{__FILE__}"
end
