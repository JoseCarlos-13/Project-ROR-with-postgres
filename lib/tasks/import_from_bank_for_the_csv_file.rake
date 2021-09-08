require 'csv'

namespace :author do
  desc 'save and read CSV files'
  task :read_and_save_in_file => :environment do
    puts 'importing files*'
    puts 'writing the values*'

    CSV.open('lib/tasks/test.csv', "w") do |csv|
       csv << Author.column_names[1..3]

      Author.all.each do |col_value|
        csv << col_value.slice(:name, :created_at, :updated_at).values
      end
    end

    CSV.foreach('lib/tasks/test.csv', headers: true) do |row|
      puts row.inspect
    end

    puts 'done!'
  end

  desc 'import the csv data for the data bank'
  task :import_for_the_bank => :environment do
    CSV.foreach('lib/tasks/test.csv', headers: true) do |row|
      Author.create!(name: row['name'])
    end
  end
end

desc "passing params with 'rake way'"
task :param, [:first_name, :last_name] => :environment do |task, args|
  puts "parâmetros #{args[:first_name].to_s} #{args[:last_name].to_s}"
end
