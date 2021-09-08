namespace :ap do
  task :amper, [:first, :last] => :environment do |task, args|
    puts "Is working #{args[:first].to_s} #{args[:last].to_s}"
  end
end