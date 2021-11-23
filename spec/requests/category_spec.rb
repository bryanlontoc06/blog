require 'rails_helper'

RSpec.describe "Categories-Routes", :type => :request do
  describe "POST /categories/new" do
    it "1. As a User, I want to create a category that can be used to organize my tasks" do
      get "/categories/new"
      expect(response).to have_http_status(200)
      expect(response).to render_template(:new)
      post "/categories", :params => {:category => {name: "My Category"}}
      expect(response).to redirect_to(assigns(:category))
      follow_redirect!
      expect(response).to render_template(:show)
    end
  end

  describe "GET /categories/edit" do
    it "2. As a User, I want to edit a category to update the category's details" do
      Category.create!(name: "test category")
      id = Category.last.id
      get edit_category_path(id)
      expect(response).to have_http_status(200)
      expect(response).to render_template(:edit)
    end
  end

  describe "GET /categories/show" do
    it "3. As A User, I want to view a category to show the category's details" do
      Category.create!(name: "test category")
      id = Category.last.id
      get categories_path(id)
      expect(response).to be_successful
      expect(response).to have_http_status(200)
      expect(response).to render_template(:index)
    end
  end
end
