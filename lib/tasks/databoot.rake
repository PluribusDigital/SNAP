task "pop" => [:environment] do 
  Retailer.all.each{|r|r.destroy}
  SnapRetailerService.import_data
end