task "pop" => [:environment] do 
  Retailer.create(name:"safeway")
  Retailer.create(name:"7-eleven")
end