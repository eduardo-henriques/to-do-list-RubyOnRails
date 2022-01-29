class ToDoList < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true, length:{minumum:5}
    validates :priority, presence: true
    validates :done, presence: true
end
