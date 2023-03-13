class Book < ApplicationRecord
    validates :title, presence: true

    has_one: :author
end