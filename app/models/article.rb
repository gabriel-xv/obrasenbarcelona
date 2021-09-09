class Article < ApplicationRecord
  CATEGORIES = ['Baños', 'Cocinas', 'Fachadas', 'Instalaciones', 'Reformas Integrales', 'Suelos', 'Terrazas'].freeze
  belongs_to :user
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items
  has_many_attached :photos
  has_rich_text :rich_description
  validates_presence_of :title, :rich_description, :category
  validates :category, inclusion: { in: CATEGORIES }
end
