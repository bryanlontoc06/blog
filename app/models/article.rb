class Article < ApplicationRecord
    validates :name, presence: true, uniqueness: true,
                    format: { with: /\A[a-zA-Z]+\z/, message: "Only allows letters. Spacing is not allowed!" },
                    length: { minimum: 4 }

    validates :body, presence: true, length: { minimum: 10 }
end
