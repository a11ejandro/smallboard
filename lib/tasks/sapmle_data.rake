namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                         email: "example@railstutorial.org",
                         password: "foobar",
                         password_confirmation: "foobar")
    admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
     end
     
    5.times do |n|
      Category.create!(title: "Category #{n}")
    end
                 
  
  users = User.all(limit: 6)
  categories = Category.all
    20.times do |n|
      content = Faker::Lorem.sentence(5)
      title = 'Test Post'
      users.each do |user| post = user.posts.build(content: content, title: title, email: user.email,)
         post.category = categories[n % 5]
         post.save 
       end
    end
  end
end
