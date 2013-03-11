require 'spec_helper'

describe "Post pages" do

  subject { page }

  let(:user) { FactoryGirl.create(:user) }
  let(:category) { FactoryGirl.create(:category) }
  let(:admin) {FactoryGirl.create(:admin)}
  before { sign_in user }

  describe "post creation" do
    before { visit category_path(category) }

    describe "with invalid information" do

      it "should not create a post" do
        expect { click_button "Post" }.not_to change(Post, :count)
      end

      describe "error messages" do
        before { click_button "Post" }
        it { should have_content('error') } 
      end
    end

    describe "with valid information" do

      before do
         fill_in 'post_content', with: "Lorem ipsum" 
         fill_in 'post_email', with: "foo@bar.com"
         fill_in 'post_title', with: 'Test Post'
       end
       
      it "should create a post" do
        expect { click_button "Post" }.to change(Post, :count).by(1)
      end
    end
  end
  
  describe "edit" do
    let(:post) { FactoryGirl.create(:post, user: user, category: category) }
    
    before do
      sign_in admin
      visit edit_post_path(post)
    end

    describe "page" do
      it { should have_selector('h1',    text: "Update post") }
      it { should have_selector('title', text: "Edit post") }
    end

    describe "with invalid information" do
      before do
        fill_in "Email",            with: 'WrongEmail'
        click_button "Update"
      end         

      it { should have_content('error') }
    end
    
    describe "with valid information" do
      let(:new_title)  { "New title" }
      let(:new_email) { "new@example.com" }
      let(:new_content) {'This is new content'}
      before do
        fill_in "Title",            with: new_title
        fill_in "Email",            with: new_email
        fill_in "Content",          with: new_content
        
        click_button "Update"
      end

      it { should have_content(new_title) }
      it { should have_content(new_email) }
      it { should have_content(new_content) }
      it { should have_selector('div.alert.alert-success') }
      
    end
  end
end