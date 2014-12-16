Rails.application.routes.draw do

 root :to => 'shop#group'
 
  #group / products
  get 'group/:link' => 'shop#group', :as => :shop_group
  get 'prod/:link' => 'shop#product', :as => :shop_product

  # cart
  match 'cart/add/:id' => 'shop#add', :as => :cart_add , :via => [:get,:post]
  get 'cart/remove/:id' => 'shop#remove', :as => :cart_remove

  # checkout + order
  get 'order' => 'shop#order', :as => :shop_order
  match 'checkout' => 'shop#checkout', :as => :shop_checkout , :via => [:get,:post]
  get "history" => "shop#history" , :as => :shop_history

  get 'welcome' => 'shop#welcome', :as => :shop_welcome
  get 'page/:id' => 'shop#page', :as => :shop_page


  get "/404", :to => "application#error"

  mount OfficeClerk::Engine => "/"

end
