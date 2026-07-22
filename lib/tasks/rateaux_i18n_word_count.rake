# frozen_string_literal: true

# Show the number of translated words in every available locale.
#
#     $ rake i18n:word_count

require "unicode/emoji"

class RateauxI18nWordCount
  include ActionView::Helpers::SanitizeHelper

  def words_for_locale(locale)
    translations = I18n.t(".", locale: locale)
    words = hash_string_values(translations).flat_map do |translation|
      strip_tags(translation).split(/\s+/)
    end
    words.reject do |word|
      word.blank? ||
        word.size == 1 ||
        word.start_with?("%") ||
        word.match?(Unicode::Emoji::REGEX_VALID_INCLUDE_TEXT)
    end
  end

  private

  def hash_string_values(hash)
    hash.inject([]) do |array, (_key, value)|
      case value
      when Hash then array + hash_string_values(value)
      when String then array + [value]
      else array
      end
    end
  end
end

namespace :i18n do
  desc "Show the number of translated words in every available locale"
  task word_count: :environment do
    counter = RateauxI18nWordCount.new

    I18n.available_locales.each do |locale|
      words = counter.words_for_locale(locale)
      puts "#{locale}: #{words.count} (#{words.uniq.count} unique)"
    end
  end
end
