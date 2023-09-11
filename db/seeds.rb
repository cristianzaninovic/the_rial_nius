10.times do 
  user = NiusUser.new(
    :email                 => Faker::Internet.email,
    :password              => "123456",
    :password_confirmation => "123456"
  )
  user.save!
end

user = NiusUser.new(
  :email                 => 'czaninovic@gmail.com',
  :password              => "123456",
  :password_confirmation => "123456",
  :role => 'admin'
)
user.save!

40.times do
  n = Niu.new
  n.nius_user_id = rand(1..10)
  n.title = Faker::Lorem.sentence
  n.headline = Faker::Lorem.sentence
  n.content = Faker::Lorem.paragraph

  n.save!
end

puts 'Se han creado 40 noticias aleatorias.'

100.times do
  comment = Comment.new
  comment.content = Faker::Lorem.paragraph
  comment.niu_id = rand(1..40)
  comment.nius_user_id = rand(1..10)

  comment.save!
end

puts 'Se han creado 100 comentarios aleatorios.'