task :setup do 
  # `npm install`
  Rake::Task['db:reset'].invoke
end
