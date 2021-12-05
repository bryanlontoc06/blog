require 'rails_helper'

RSpec.describe "Task models", type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  let!(:category) {Category.create!(name: 'Test Category')}

  let!(:task) {Task.create!(category_id: category.id, name: 'test name', body: 'this is a test body', task_date: Date.current)}

  context 'Validations' do 
      describe "Name field must not be blank" do
        it '1. Is not valid without a name' do
          task.name = nil
          task.body = 'Sample body'

          expect(task).to_not be_valid
          expect(task.errors).to be_present
          expect(task.errors.to_hash.keys).to include(:name)
        end
      end

      describe "Body field must not be blank" do
        it '2. Is not valid without a body' do
          task.name = 'Sample name'
          task.body = nil

          expect(task).to_not be_valid
          expect(task.errors).to be_present
          expect(task.errors.to_hash.keys).to include(:body)
        end
      end

      describe "Task Date field must not be blank" do
        it '3. Is not valid without a Task Date' do
          task.name = 'Sample name'
          task.body = 'Sample body'
          task.task_date = nil


          expect(task).to_not be_valid
          expect(task.errors).to be_present
          expect(task.errors.to_hash.keys).to include(:task_date)
        end
      end

      describe "Characters quantity (name)" do
        it '4. Has a name with at least 4 characters long' do
          task.name = 'tes'
          expect(task).to_not be_valid
          expect(task.errors).to be_present
          expect(task.errors.to_hash.keys).to include(:name)

          task.name = 'test'
          expect(task).to be_valid
        end
      end

      describe "Characters quantity (body)" do
        it '5. Has a body with at least 5 characters long' do
          task.body = 'body'
          expect(task).to_not be_valid
          expect(task.errors).to be_present
          expect(task.errors.to_hash.keys).to include(:body)

          task.body = 'body1'
          expect(task).to be_valid
        end
      end
    end

    context 'Functions' do
        describe "Creating a Task" do
          it "6. As a User, I want to create a task for a specific category so that I can organize tasks quicker" do
            expect(category.tasks.count).to eq(1)
          end
        end

        describe "Reading a created Task" do
          it "7. As a User, I want to view a task for a specific category that I've created" do
              expect(category.tasks.last.name).to eq('test name')
          end
        end

        describe "Updating a created Task" do
          it "8. As a User, I want to edit a task to update task's details" do
            task.name = 'this is updated'
            expect(task.name).to eq('this is updated')
          end
        end

        describe "Deleting a created Task" do
          it "9. As a User, I want to delete a task for a specific category that I've created" do
            task_added = category.tasks.create!(category_id: Category.last.id, name:"Task name", body:"Task body",task_date: Date.current)
            count = Task.count
            task_added.destroy
            expect(Task.count).to eq(count - 1)
          end
        end
    end
end
