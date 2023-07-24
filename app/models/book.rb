class Book < ApplicationRecord
    validates :title, presence: true
    validates :page, presence: true
    validates :price, presence: true
end
