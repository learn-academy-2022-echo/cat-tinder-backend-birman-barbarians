require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do 
      Cat.create(
        name: 'Brownie',
        age: 19,
        enjoys: 'Sleeping on the Couch',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )

      get '/cats'

      cat = JSON.parse(response.body)
      expect(response). to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end



  describe "POST /create" do
    it "creates a cat" do 
      cat_params = {
        cat: {name: 'Brownie',
        age: 19,
        enjoys: 'Sleeping on the Couch',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'}
      }

      post '/cats', params:cat_params
      expect(response).to have_http_status(200)

      cat = Cat.first
      expect(cat.name).to eq 'Brownie'
    end
  end



  describe "PATCH /update" do
    it "updates an instancet" do 
      
      Cat.create(
        name: 'Brownie',
        age: 19,
        enjoys: 'Sleeping on the Couch',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )

      second_cat = Cat.first

      patch "/cats/#{second_cat.id}", params: {
        cat: {
          name: 'Cookie',
          age: 23,
          enjoys: 'Eatting',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }

      second_cat = Cat.first
      expect(second_cat.age).to eq(23)
      expect(second_cat.name).to eq('Cookie')
      expect(second_cat.enjoys).to eq('Eatting')
  
    end
  end







end

