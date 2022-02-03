class List < ApplicationRecord
    has_many :to_do_lists, dependent: :destroy

    validates :title, presence: true
    validates :description, presence: true, length: { minimum: 5 }
end
