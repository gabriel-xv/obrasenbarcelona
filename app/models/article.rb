class Article < ApplicationRecord
  belongs_to :user
  has_many_attached :photos

  CATEGORIES = ['Baños', 'Cocinas', 'Fachadas', 'Instalaciones', 'Reformas Integrales', 'Suelos', 'Terrazas'].freeze

  validates_presence_of :title, :description, :category
  validates :category, inclusion: { in: CATEGORIES }
end
