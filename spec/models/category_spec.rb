require 'rails_helper'
# RSpec.describe Category, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
describe Category, type: :model do
    let!(:category) {Category.new}
    it '1. As a User, I want to create a category that can be used to organize my tasks' do
        category_count = Category.count
        category.name = "category1"

        category.save!
        expect(Category.count).to eq(1)
    end 

    it "2. As a User, I want to edit a category to update the category's details" do
        category = Category.create!(name: "Testttt")
        category.update(name: 'This is the updated')
        expect(category.name).to eq("This is the updated")
    end

    it "3. As a User, I want to view a category to show the category's details" do
        category.name = "name"
        
        expect(category.name).to eq('name')
    end
end