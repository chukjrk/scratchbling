class Scratcher < ApplicationRecord
	validates :title, presence: true
	validates :description, presence: true
	validates :size, presence: true
	validates :price, presence: true
end
