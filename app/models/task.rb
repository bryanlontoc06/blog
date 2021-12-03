class Task < ApplicationRecord
    validates :name, presence: true, length: { minimum: 4 }

    validates :body, presence: true, length: { minimum: 5 }

    validates :task_date, presence: true

    belongs_to :category
end
