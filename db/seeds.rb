User.create!(
           name: "morisaki",
           email: "mori@mori.com",
           password:              "morimori",
           password_confirmation: "morimori",
           admin: true)

99999.times do |n|
user_name  = Faker::Name.name
email = "example-#{n+1}@railstutorial.org"
password = "password"
password_confirmation = "password"
User.create!(name: user_name,
             email: email,
             password:              password,
             password_confirmation: password)
end


Space.create!(
           space_name: "ginza",
           ward_id: "1",
           price: "5000",
           )

9999.times do |n|
gimei = Gimei.new
Space.create!(space_name: gimei.address.prefecture.kanji,
             ward_id: rand(1..23),
             price: rand(5000..10000)
             )
end