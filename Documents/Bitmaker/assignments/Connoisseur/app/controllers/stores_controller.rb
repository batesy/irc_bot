class StoresController < ApplicationController
  def index
    stores_json = open('http://lcboapi.com/stores').read
    @stores = JSON.parse(stores_json)
  end

  def show
    store_json = open("http://lcboapi.com/stores/#{params['id']}").read
    @store = JSON.parse(store_json)['result']
  end
end
