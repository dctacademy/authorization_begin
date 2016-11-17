task :setup_data => :environment do 
	# Create Roles
	Role.create(name: "admin")
	Role.create(name: "moderator")
	Role.create(name: "author")
	Role.create(name: "user")

	# Create Users & Assign Roles
	user = User.create(email: "admin@gmail.com", password: "secret123")
	user.roles.push(Role.first) #assign admin role
	user.roles.push(Role.last)  #assign user role

	user = User.create(email: "moderator@gmail.com", password: "secret123")
	user.roles.push(Role.second)
	user.roles.push(Role.last)

	user1 = User.create(email: "author@gmail.com", password: "secret123")
	user1.roles.push(Role.third)
	user1.roles.push(Role.last)

	user2 = User.create(email: "author1@gmail.com", password: "secret123")
	user2.roles.push(Role.third)
	user2.roles.push(Role.last)

	user = User.create(email: "1@gmail.com", password: "secret123")
	user.roles.push(Role.last)

	# Create Articles
	3.times do 
		Article.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user_id: user1.id)
	end

	3.times do 
		Article.create(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph, user_id: user2.id)
	end


end