class ApplicationController < Sinatra::Base

  set :default_content_type , 'application/json'
  # add routes

  get '/bakeries' do 
    bakeries = Bakery.all
    bakeries.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price:' do 
    baked_good = BakedGood.by_price
    baked_good.to_json
  end

  get '/baked_goods/most_expensive' do 
    baked_good = BakedGood.by_price.first
    baked_good.to_json
  end

end


# After setting up your models, it's time to work on your routes! Since this is your first lab in Sinatra, here's a recommendation on how to approach writing routes based on the deliverables below.

# Let's work on the first deliverable, defining a route that responds to a GET request to /bakeries and returns an array of JSON objects for all bakeries in the database.

# Start by running the server with bundle exec rake server. Then, in your browser, visit that endpoint with the server running: http://localhost:9292/bakeries (Links to an external site.). You should see a helpful error message from Sinatra, like this: