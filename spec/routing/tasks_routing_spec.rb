require "rails_helper"

RSpec.describe TasksController, type: :routing do
  describe "Tasks routing" do
    # it "routes to #index" do
    #   expect(get: "/tasks").to route_to("tasks#index")
    # end

    it "1. Routes to #new" do
      expect(get: "/categories/1/tasks/new").to route_to("tasks#new", category_id: "1")
    end

    it "2. Routes to #show" do
      expect(get: "/categories/1/tasks/1").to route_to("tasks#show", category_id: "1", id: "1")
    end

    it "3. Routes to #edit" do
      expect(get: "/categories/1/tasks/1/edit").to route_to("tasks#edit", category_id: "1", id: "1")
    end


    it "4. Routes to #create" do
      expect(post: "/categories/1/tasks").to route_to("tasks#create", category_id: "1")
    end

    it "5. Routes to #update via PUT" do
      expect(put: "/categories/1/tasks/1").to route_to("tasks#update", category_id: "1", id: "1")
    end

    it "6. Routes to #update via PATCH" do
      expect(patch: "/categories/1/tasks/1").to route_to("tasks#update", category_id: "1", id: "1")
    end

    it "7. Routes to #destroy" do
      expect(delete: "/categories/1/tasks/1").to route_to("tasks#destroy", category_id: "1", id: "1")
    end
  end
end
