require 'spec_helper'

describe "shop checkout"  do
  def prepare_check
    prod = create :shop_product
    visit_path shop_product_path(prod.link)
    click_button "add-to-cart-button"
    visit_path shop_checkout_path
  end
  it "fails checkout without email" do
    prepare_check
    choose(:validation)
    click_button "make_order"
    expect(page).to have_content( I18n.t(:fix_errors))
    ensure_path shop_checkout_path
  end
  it "checks out with email" do
    prepare_check
    choose(:validation)
    fill_in :order_email , :with => "info@auringostaitaan.fi"
    click_button "make_order"
    ensure_path shop_order_path
  end
  it "doesnt checkout without accepting" do
    prepare_check
    click_button "make_order"
    expect(page).to have_content( I18n.t(:must_accept))
    ensure_path shop_checkout_path
  end
  it "checks out when signed in" do
    sign_in
    prepare_check
    choose(:validation)
    click_button "make_order"
    ensure_path shop_order_path
  end
  it "redirects when accessing history without login" do
    visit shop_history_path
    ensure_path office.sign_in_path
  end
end
