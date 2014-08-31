require "iso4217/validator/version"
require 'iso4217/validator/valid_codes'
module Iso4217
  module Validator
    
    class Iso4217CodeValidator < ActiveModel::EachValidator
      def validate_each(record, attribute, value)
        record.errors.add(attribute, options[:message] || :invalid) unless Iso4217Codes.include?(value) 
    	end
    end
  end
end
