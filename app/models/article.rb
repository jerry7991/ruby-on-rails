class Article < ApplicationRecord

  include Visible

  has_many :comments, dependent: :destroy  # One to many. A single article can have many comments
  validates :title, presence: true
  validates :body, presence: true, length: {minimum:10}
end
