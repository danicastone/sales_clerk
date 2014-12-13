require 'spec_helper'

describe ShopController  do
  it "fails checkout without email" do
    prod = create :shop_product
    visit_path shop_product_path(prod.link)
    click_button "add-to-cart-button"
    visit_path shop_checkout_path
    click_button "make_order"
    expect(page).to have_content( I18n.t(:fix_errors))
    ensure_path shop_checkout_path
  end
  it "checks out with email" do
    prod = create :shop_product
    visit_path shop_product_path(prod.link)
    click_button "add-to-cart-button"
    visit_path shop_checkout_path
    fill_in :order_email , :with => "some@valid.it"
    click_button "make_order"
    ensure_path shop_order_path
  end
  it "shows a page" do
    visit_path shop_page_path :tuotteista
  end
  it "renders welcome page" do
    visit_path shop_welcome_path
  end
end
