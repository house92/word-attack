class List < ApplicationRecord
  has_many :word_lists
  has_many :words, through: :word_lists
  belongs_to :language
end
