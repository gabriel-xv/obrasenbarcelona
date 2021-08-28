class Article < ApplicationRecord
  belongs_to :user
  has_many_attached :photos
  has_many :pictures, dependent: :destroy
  has_rich_text :rich_description

  CATEGORIES = ['Baños', 'Cocinas', 'Fachadas', 'Instalaciones', 'Reformas Integrales', 'Suelos', 'Terrazas'].freeze

  validates_presence_of :title, :rich_description, :category
  validates :category, inclusion: { in: CATEGORIES }
end
