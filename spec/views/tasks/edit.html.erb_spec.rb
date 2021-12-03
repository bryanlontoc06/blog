# require 'rails_helper'

# RSpec.describe "tasks/edit", type: :view do
#   before(:each) do
#     @task = assign(:task, Task.create!(
#       category_id: 1,
#       name: "MyString",
#       body: "MyText",
#       task_date: ""
#     ))
#   end

#   it "renders the edit task form" do
#     render

#     assert_select "form[action=?][method=?]", task_path(@task), "post" do

#       assert_select "input[name=?]", "task[category_id]"

#       assert_select "input[name=?]", "task[name]"

#       assert_select "textarea[name=?]", "task[body]"

#       assert_select "input[name=?]", "task[task_date]"
#     end
#   end
# end
