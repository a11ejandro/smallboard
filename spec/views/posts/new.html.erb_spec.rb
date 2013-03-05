require 'spec_helper'

describe "posts/new" do
  before(:each) do
    assign(:post, stub_model(Post,
      :title => "MyString",
      :city => "MyString",
      :content => "MyText",
      :picture => "MyString",
      :email => "MyString",
      :address => "MyString",
      :user_id => 1,
      :category_id => 1
    ).as_new_record)
  end

  it "renders new post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => posts_path, :method => "post" do
      assert_select "input#post_title", :name => "post[title]"
      assert_select "input#post_city", :name => "post[city]"
      assert_select "textarea#post_content", :name => "post[content]"
      assert_select "input#post_picture", :name => "post[picture]"
      assert_select "input#post_email", :name => "post[email]"
      assert_select "input#post_address", :name => "post[address]"
      assert_select "input#post_user_id", :name => "post[user_id]"
      assert_select "input#post_category_id", :name => "post[category_id]"
    end
  end
end
