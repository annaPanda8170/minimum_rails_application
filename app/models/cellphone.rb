class Cellphone < ApplicationRecord
  validates :cellphone ,presence: true
  belongs_to :user, optional: true
end
