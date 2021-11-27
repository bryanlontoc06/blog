# require 'rails_helper'

# describe Article, type: :model do

#     let!(:article) {Article.new}

#     context 'Validations' do
#         it '1. Is not valid without a name' do
#             article.name = nil
#             article.body = 'Sample body'

#             expect(article).to_not be_valid
#             expect(article.errors).to be_present
#             expect(article.errors.to_h.keys).to include(:name)
#         end

#         it '2. Is not valid without a body' do
#             article.name = 'Sample name'
#             article.body = nil

#             expect(article).to_not be_valid
#             expect(article.errors).to be_present
#             expect(article.errors.to_h.keys).to include(:body)
#         end

#         it '3. Creates a new article if attributes are valid' do
#             article_count = Article.count
#             article.name = "name"
#             article.body = "ten characters"

#             article.save!
#             expect(Article.count).to eq(1)
#         end 

#         it '4. Has a body with at least 10 characters long' do
#             article = Article.new(name: 'Avalidname', body: '')
#             expect(article).to_not be_valid
#             expect(article.errors).to be_present
#             expect(article.errors.to_h.keys).to include(:body)

#             article.body = 'this is ten'
#             expect(article).to be_valid
#         end

#         it '5. Has a name with at least 4 characters long' do
#             article = Article.new(name: '', body: '')
#             expect(article).to_not be_valid
#             expect(article.errors).to be_present
#             expect(article.errors.to_h.keys).to include(:name)

#             article.name = 'charqwes'
#             article.body = 'this is more than ten characters'
#             expect(article).to be_valid
#         end

#         it "6. Should have a unique name" do
#             Article.create!(name: "Fooo", body: 'this is more than ten characters')
#             article = Article.new(name: 'Fooo')
#             article.should_not be_valid
#             article.errors[:name].should include("has already been taken")
#         end

#         it '7. Name should not contain a number' do
#             article = Article.new(name: 'Fooo123')
#             article.should_not be_valid
#             expect(article.errors).to be_present
#         end
#     end
# end