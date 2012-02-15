class Page < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :topic, presence: true
  validates :description, presence: true
  validates :order, presence: true, uniqueness: true
end
