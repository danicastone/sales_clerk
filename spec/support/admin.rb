unless Clerk.where( :email =>  "info@auringostaitaan.fi").first
  admin = Clerk.new( :email =>  "info@auringostaitaan.fi" , :admin => true , :password => "password" ) 
  admin.save!
end
