puts 'EMPTY THE MONGODB DATABASE'
Mongoid.master.collections.reject { |c| c.name =~ /^system/}.each(&:drop)
puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :name => 'Micha', :email => 'm@g.de', :password => 'please', :password_confirmation => 'please'
puts 'New user created: ' << user.name
puts 'SETTING UP CLASSROOMS'
classroom = Classroom.create! :name => 'Micha macht den Guru', :summary => 'Alles und die Welt'
puts 'New Classroom created: ' << classroom.name
classroom = Classroom.create! :name => 'Micha macht den Koch', :summary => 'Essen geht immer!'
puts 'New Classroom created: ' << classroom.name
classroom = Classroom.create! :name => 'Micha macht den Coder', :summary => '1337h4xx0r'
puts 'New Classroom created: ' << classroom.name
classroom = Classroom.create! :name => 'Micha macht den Rockstar', :summary => 'It is time to kick ass!'
puts 'New Classroom created: ' << classroom.name