module ShopHelper
  def parents(group)
    parents = []
    group = group.category
    while group
      parents << group
      group = group.category
    end
    parents.reverse
  end
  def in_group( product , get = 4)
    group = product.category
    return [] unless group
    prods = group.shop_products.to_a
    prods.delete(product)
    prods.sample(get)
  end
  def last_orders
    all = Order.where( :email => current_clerk.email).limit(10).to_a
    [ all.pop , all ]
  end
end
