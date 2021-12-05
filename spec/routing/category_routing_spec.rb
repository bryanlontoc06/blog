require "rails_helper"

RSpec.describe "Categories Controller", type: :routing do
  describe "Categories routing" do
    it "1. Routes to #index" do
      expect(get: "/categories").to route_to("categories#index")
    end

    it "2. Routes to #new" do
      expect(get: "/categories/new").to route_to("categories#new")
    end

    it "3. Routes to #show" do
      expect(get: "/categories/1").to route_to("categories#show", id: "1")
    end

    it "4. Routes to #edit" do
      expect(get: "/categories/1/edit").to route_to("categories#edit", id: "1")
    end


    it "5. Routes to #create" do
      expect(post: "/categories").to route_to("categories#create")
    end

    it "6. Routes to #update via PUT" do
      expect(put: "/categories/1").to route_to("categories#update", id: "1")
    end

    it "7. Routes to #update via PATCH" do
      expect(patch: "/categories/1").to route_to("categories#update", id: "1")
    end

    it "8. Routes to #destroy" do
      expect(delete: "/categories/1").to route_to("categories#destroy", id: "1")
    end
  end
end
