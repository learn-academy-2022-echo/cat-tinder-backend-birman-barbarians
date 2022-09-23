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
  it 'cannot be create without a name' do
    cat_params = {
      cat: {
        age: 2,
        enjoys: 'Walks in the park',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      }
    }
    post '/cats', params:cat_params
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['name']).to include "can't be blank"
  end
  it 'cannot be create without an age' do
    cat_params = {
      cat: {
        name: "Bruh",
        enjoys: 'Walks in the park',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      }
    }
    post '/cats', params:cat_params
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['age']).to include "can't be blank"
  end
  it 'cannot be create without a thing they enjoy' do
    cat_params = {
      cat: {
        name:"bruh",
        age: 2,
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      }
    }
    post '/cats', params:cat_params
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['enjoys']).to include "can't be blank"
  end
  it 'cannot be create without an image' do
    cat_params = {
      cat: {
        name: "bruh",
        age: 2,
        enjoys: 'Walks in the park',
      }
    }
    post '/cats', params:cat_params
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['image']).to include "can't be blank"
  end
end

