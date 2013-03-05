require 'spec_helper'

describe "posts/index" do
  before(:each) do
    assign(:posts, [
      stub_model(Post,
        :title => "Title",
        :city => "City",
        :content => "MyText",
        :picture => "Picture",
        :email => "Email",
        :address => "Address",
        :user_id => 1,
        :category_id => 2
      ),
      stub_model(Post,
        :title => "Title",
        :city => "City",
        :content => "MyText",
        :picture => "Picture",
        :email => "Email",
        :address => "Address",
        :user_id => 1,
        :category_id => 2
      )
    ])
  end

  it "renders a list of posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Picture".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
