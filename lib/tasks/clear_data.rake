task :clear_data => :environment do 
	Role.delete_all
	User.delete_all
	Permission.delete_all
	Article.delete_all
end