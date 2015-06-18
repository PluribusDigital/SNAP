task :setup do 
  puts "1: npm install..."
  `sudo npm install`
  puts "2: bundle install"
  `bundle install`
  puts "3 rake"
  Rake::Task['db:setup'].invoke
  Rake::Task['bower:install'].invoke
  Rake::Task['pop'].invoke
end
