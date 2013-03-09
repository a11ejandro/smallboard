require 'spec_helper'

describe Category do
  before do
    @user = User.new(name: "Example User", email: "user@example.com", 
                 password: "foobar", password_confirmation: "foobar")
                 
    @category = Category.new(title: 'Test Category')
  end
  
  subject { @category }
  
  it { should respond_to(:title)}
  it { should respond_to(:posts) }

  it { should be_valid }
  
  describe "when title is not present" do
    before { @category.title = " " }
    it { should_not be_valid }
  end
  
  describe "when title is too long" do
    before { @category.title = "a" * 51 }
    it { should_not be_valid }
  end
  
  describe "when title is already taken" do
    before do
      category_with_same_title = @category.dup
      category_with_same_title.title = @category.title.upcase
      category_with_same_title.save
    end

    it { should_not be_valid }
  end
  
  describe "post associations" do

    before { @category.save; @user.save }
    let!(:second_post) do 
      FactoryGirl.create(:post, user: @user, category: @category, title: 'DAD')
    end
    let!(:first_post) do
      FactoryGirl.create(:post, user: @user, category: @category, title: 'ABBA')
    end

    it "should have the right posts in the right order" do
      @category.posts.should == [first_post, second_post]
    end
    
    it "should destroy associated posts" do
      posts = @category.posts.dup
      @user.destroy
      posts.should_not be_empty
      posts.each do |post|
        Post.find_by_id(post.id).should be_nil
      end
    end
  end
end
