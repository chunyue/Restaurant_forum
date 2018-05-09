namespace :dev do 

  task fake_restaurant: :environment do
    Restaurant.destroy_all

    500.times do |i|
      Restaurant.create!(name: FFaker::Name.first_name,
        opening_hours: FFaker::Time.datetime,
        tel: FFaker::PhoneNumber.short_phone_number,
        address: FFaker::Address.street_address,
        description: FFaker::Lorem.paragraph,
        category: Category.all.sample
        )
      end  

      puts "have created fake restaurants"
      puts "now you have #{Restaurant.count} restaurants data"
  end

  task fake_user: :environment do

    20.times do |i|
      User.create!(
        email: FFaker::Internet.safe_email,
        password: FFaker::Internet.password,
        name: FFaker::Name.first_name,
        avatar: FFaker::Avatar.image
        )
    end
    puts "have created #{User.count} users"  
  end 
  
  task fake_comment: :environment do

    Restaurant.all.each do |restaurant|
      restaurant.comments.destroy_all
      3.times do |i|
        restaurant.comments.create!(
          content: FFaker::Lorem.sentence,
          user: User.all.sample  
          )
      end  
    end 
    puts "have create fake comments"
    puts "now you have #{Comment.count} comment date"   
  end 

  task fake_image: :environment do
    Restaurant.all.each do |r|
      r.update(
          image: File.open(Rails.root.join("public/seed_img/#{rand(0...2)}.jpg"))
      )
    end 
    puts "have create fake images" 
  end 


    
end      