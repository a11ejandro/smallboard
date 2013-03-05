require 'spec_helper'

describe "posts/show" do
  before(:each) do
    @post = assign(:post, stub_model(Post,
      :title => "Title",
      :city => "City",
      :content => "MyText",
      :picture => "Picture",
      :email => "Email",
      :address => "Address",
      :user_id => 1,
      :category_id => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/City/)
    rendered.should match(/MyText/)
    rendered.should match(/Picture/)
    rendered.should match(/Email/)
    rendered.should match(/Address/)
    rendered.should match(/1/)
    rendered.should match(/2/)
  end
end
