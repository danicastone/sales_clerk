# poor mans migration. 
# Trying to keep the schema clean until version 1

unless Product.columns_hash["summary"]
 # ActiveRecord::Base.connection.add_column :products, :summary, :string
end
unless Category.columns_hash["summary"]
#  ActiveRecord::Base.connection.add_column :categories, :summary, :string
end


def short text , chop = "**"
  ind = text.index( chop , 10)
  if ind
    return text[0 .. ind + 1] 
  else
    return text[0 .. 100] 
  end
end
