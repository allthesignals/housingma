# ActiveSupport::Inflector#indefinitize
# from https://rails.lighthouseapp.com/projects/8994/tickets/2566-add-aan-inflector-indefinitize

# Add indefinitize Inflector to ActiveSupport

require 'active_support/inflector/inflections'
require 'active_support/inflections'

module ActiveSupport
  module Inflector
    extend self

    # Prepends the correct indefinite article based on first letter (vowel or
    # consonant).  Defaults to 'a' or 'an'.
    #
    # Examples:
    #   "goat"            # => "a goat"
    #   "original sin"    # => "an original sin"
    def indefinitize(word, consonant = 'a', vowel = 'an')
      result = word.to_s.dup
      result.match(/^([aeiou])/i) ? "#{vowel} #{result}" : "#{consonant} #{result}"
    end

  end
end


# Add ActiveSupport::Inflector method to String 

require 'active_support/inflector/methods'
require 'active_support/inflector/transliterate'

class String

  # Prepends the correct indefinite article based on first letter (vowel or
  # consonant).  Defaults to 'a' or 'an'.
  #
  #   "goat"            # => "a goat"
  #   "original sin"    # => "an original sin"
  #   "Bentley"         # => "a Bentley"
  #   "e-mail"          # => "an e-mail"
  def indefinitize(consonant = 'a', vowel = 'an')
    ActiveSupport::Inflector.indefinitize(self, consonant, vowel)
  end
  
end