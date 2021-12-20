require 'rails_helper'

RSpec.describe "Cats", type: :request do
  let (:cat) { create(:cat) }

  context 'GET' do
    it '#root, #homepage' do
      get root_path
      expect(response).to render_template(:index)
      expect(response).to have_http_status(200)
    end
    it '#show' do
      get cat_path(cat)
      expect(response).to render_template(:show)
      expect(response).to have_http_status(200)
    end
    it '#new' do
      get new_cat_path
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
    end
    it '#edit' do
      get edit_cat_path(cat)
      expect(response).to render_template(:edit)
      expect(response).to have_http_status(200)
    end
  end  
  context 'POST and PATCH' do
    it '#create' do
      get new_cat_path
      expect(response).to render_template(:new)
      expect(response).to have_http_status(200)
      post '/cats', params: { cat: { name: "CatNameTest", age: "CatAgeTest", weight: "CatWeightTest", eye_color: "CatEyeColorTest" } }
      expect(cat).to be_valid
      expect(Cat.where(name: cat.name)).to have(1).record
      expect(response).to redirect_to("/cats/#{assigns(:cat).id}")
    end
    it '#update' do
      p cat
      put "/cats/#{cat.id}", params: { cat: { name: "UpdatedName", age: "UpdatedAge", weight: "UpdatedWeight", eye_color: "UpdatedEyeColor" } }
      cat.reload
      expect(cat).to be_valid
      expect(Cat.where(name: cat.name)).to have(1).record
      expect(response).to redirect_to("/cats/#{assigns(:cat).id}")
      p cat
    end
  end      
  context 'invalid' do
    it 'post' do
      cat.name = nil
      cat.eye_color = nil
      post '/cats', params: { cat: { name: cat.name, age: cat.age, weight: cat.weight, eye_color: cat.eye_color } }
      expect(cat).not_to be_valid
    end
    it 'put' do
      cat.name = nil
      cat.eye_color = nil
      put "/cats/#{cat.id}", params: { cat: { name: cat.name, age: "UpdatedAge", weight: "UpdatedWeight", eye_color: cat.eye_color } }
      expect(cat).not_to be_valid
    end
  end
  context 'DELETE' do
    it 'destroy' do
      delete "/cats/#{cat.id}"
      expect(Cat.where(name: cat.name)).to have(0).records
    end
  end
end