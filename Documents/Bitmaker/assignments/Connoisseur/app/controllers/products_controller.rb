class ProductsController < ApplicationController
  def index
    products_json = open('http://lcboapi.com/products?order=limited_time_offer_savings_in_cents.desc').read
    @products = JSON.parse(products_json)
  end

  def show
    product_json = open("http://lcboapi.com/products/#{params['id']}").read
    @product = JSON.parse(product_json)['result']
  end
end
