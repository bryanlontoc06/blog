# require 'rails_helper'

# RSpec.describe "tasks/index", type: :view do
#   before(:each) do
#     assign(:tasks, [
#       Task.create!(
#         category_id: 2,
#         name: "Name",
#         body: "MyText",
#         task_date: ""
#       ),
#       Task.create!(
#         category_id: 2,
#         name: "Name",
#         body: "MyText",
#         task_date: ""
#       )
#     ])
#   end

#   it "renders a list of tasks" do
#     render
#     assert_select "tr>td", text: 2.to_s, count: 2
#     assert_select "tr>td", text: "Name".to_s, count: 2
#     assert_select "tr>td", text: "MyText".to_s, count: 2
#     assert_select "tr>td", text: "".to_s, count: 2
#   end
# end
