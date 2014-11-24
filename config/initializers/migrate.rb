# poor mans migration. 
# Trying to keep the schema clean until version 1

unless Product.columns_hash["summary"]
  ActiveRecord::Base.connection.add_column :products, :summary, :string , :default => ""
end
unless Category.columns_hash["summary"]
  ActiveRecord::Base.connection.add_column :categories, :summary, :string , :default => ""
end
