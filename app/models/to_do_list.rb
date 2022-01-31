class ToDoList < ApplicationRecord
    validates :name, presence: true
    validates :description, presence: true
    validates :priority, presence: true
    validates :done, inclusion: [true, false]
    validates :done, exclusion: [nil]
end
