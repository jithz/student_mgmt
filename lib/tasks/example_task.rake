namespace :example_task do
  desc 'Greeting msg task'

  task greet_the_user: :environment do
    puts 'Hello user, welcome to the rake world!'
  end

  task say_bye_to_user: :environment do
    puts 'its time to signoff. bye bye'
  end
end

