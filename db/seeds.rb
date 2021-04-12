# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

names = ["Lissette", "Gustavo", "Pepa", "Nova", "Marcelo"]
imgs = ["https://cdn.pixabay.com/photo/2015/02/25/17/56/cat-649164__340.jpg",
        "https://cdn.pixabay.com/photo/2015/08/30/10/58/cat-914110__340.jpg",
        "https://cdn.pixabay.com/photo/2015/11/07/11/34/kitten-1031261__340.jpg",
        "https://cdn.pixabay.com/photo/2017/05/05/22/28/kitten-2288404__340.jpg",
        "https://cdn.pixabay.com/photo/2016/11/22/19/02/cat-1850056__340.jpg"]

5.times do |i|
  User.create(name: names[i],
              photo: imgs[i],
              email:  "#{names[i].downcase}@example.com",
              password: "123456"
  )
end

50.times do
  Tweet.create(content: Faker::Quote.yoda,
              user_id:  Random.rand(1..5),
              parent_tweet: (Tweet.all.count>0 && rand>0.5)? Tweet.all.order('random()').first.id : nil
              if :parent_tweet != nil 
                content_retweet: Tweet.find(:parent_tweet).content
              else
                content_retweet: nil
              end
  )
end

5.times do |i|
  lista_num = (1..50).sort
  5.times do 
    select = (lista_num.shuffle)[0]
    Like.create(user_id: i+1,
              tweet_id: select
    )
    lista_num.delete(select)
  end
end