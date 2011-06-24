puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Micha', :email => 'm@g.de', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.name