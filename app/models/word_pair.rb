class WordPair < ApplicationRecord
  validate { |word_pair| word_pair.validate_count }

  protected

  def validate_count
    word_ids.count == 2
  end
end
