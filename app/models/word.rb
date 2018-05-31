class Word < ApplicationRecord
  belongs_to :language
  has_many :word_lists
  has_many :lists, through: :word_lists

  scope :translations, (lambda do |id|
    translation_ids = WordPair.where("word_ids @> '{#{id}}'").map(&:word_ids).flatten
    translation_ids.reject { |word_id| word_id == id}.map { |word_id| Word.find_by(id: word_id) }
  end)

  def translations
    self.class.translations(id)
  end
end
