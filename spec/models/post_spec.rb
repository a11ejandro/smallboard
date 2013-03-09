require 'spec_helper'

describe Post do

  let(:user) { FactoryGirl.create(:user) }
  let(:category) {FactoryGirl.create(:category)}
  before do @post = user.posts.build(content: "Lorem ipsum", title: "Test post", email: "foo@bar.com") 
    @post.category = category
  end

  subject { @post }
  
  it { should respond_to(:title) }
  it { should respond_to(:content) }
  it { should respond_to(:picture) }
  it { should respond_to(:email) }
  it { should respond_to(:city) }
  it { should respond_to(:address) }
  it { should respond_to(:user_id) }
  it { should respond_to(:category_id) }
  
  it { should respond_to(:category)}
  it { should respond_to(:user) }
  its(:user) { should == user }
  its(:category) {should == category}

  it { should be_valid }

  describe "accessible attributes" do
    it "should not allow access to user_id" do
      expect do
        Post.new(user_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end 
    
    it "should not allow access to category_id"  do
      expect do
        Post.new(category_id: user.id)
      end.to raise_error(ActiveModel::MassAssignmentSecurity::Error)
    end
  end

  describe "when user_id is not present" do
    before { @post.user_id = nil }
    it { should_not be_valid }
  end
  
  describe "with blank content" do
    before { @post.content = " " }
    it { should_not be_valid }
  end
  
  describe "with title that is too long" do
    before { @post.title = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "with blank content" do
    before { @post.title = " " }
    it { should_not be_valid }
  end
  
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @post.email = invalid_address
        @post.should_not be_valid
      end
    end
  end     
  
  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @post.email = valid_address
        @post.should be_valid
      end      
    end
  end
end
