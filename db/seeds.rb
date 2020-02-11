# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
for i in 1..30
  name = Faker::Name.name
  email = Faker::Internet.safe_email(name)

  user = User.new
  user.email = email
  user.name = name
  if user.save
    p "Saved user ##{i}: #{name} (#{email})"
    for ii in 1..30
      article = Article.new
      article.user = user
      article.title = Faker::Book.title
      article.content = Faker::Quote.yoda
      if article.save
        p "Article ##{ii} saved for #{name}"
          for iii in 1..10
            comment = Comment.new
            comment.user = user
            comment.article = article
            comment.message = Faker::Lorem.paragraph
            if comment.save
              p "Comment ##{iii} saved for #{name}"
            else
            p comment.errors
            end
          end
      else
        p article.errors
      end
    end
  else
    p user.errors
  end
end