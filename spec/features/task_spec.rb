require 'rails_helper'


RSpec.describe "Task Feature", type: :feature do
    let!(:category) {Category.create!(name: 'Test Category')}
    let!(:task) {Task.create!(category_id: category.id, name: 'test name', body: 'this is a test body', task_date: Date.current)}

    before do
        create('user')
        visit new_user_session_path
        fill_in 'user_email', with: 'test@example.com'
        fill_in 'user_password', with: '123456' 
        click_on 'Log in'       
    end

    describe "Creating a Task" do
        it "1. As a User, I want to create a task for a specific category so that I can organize tasks quicker" do
            visit new_category_task_path(category.id, task.id)
            fill_in 'task_name', with: 'Test Task'
            fill_in 'task_body', with: 'Test Body Task'
            have_select 'task_task_date', with: Date.current
            click_on ('Create Task')
            expect(page).to have_text('Task was successfully created')
        end
    end

    describe "Reading a created Task" do
        it "2. As a User, I want to view a task for a specific category that I've created" do
            visit category_path(category.id)
            click_on ('Show')
            expect(page).to have_text('test name')
            expect(page).to have_text(Date.current)
        end
    end

    describe "Updating a created Task" do
        it "3. As a User, I want to edit a task to update task's details" do
            visit edit_category_task_path(category.id,  task.id)
            fill_in 'task_name', with: 'Updated Task'
            click_on ('Update Task')
            expect(page).to have_text('Task was successfully updated')
            expect(page).to have_text('Updated Task')
        end
    end

    describe "Deleting a created Task" do
        it "4. As a User, I want to delete a task for a specific category that I've created" do
            visit category_path(category.id)
            click_on ('Delete')
            expect(page).to have_text('Task was successfully deleted!')
        end
    end
end