require 'rubygems'
require "minitest/autorun"

require 'active_record'
require 'active_model'
require 'iso4217/validator'

module Iso4217
  module Validator
    
    class SampleModel
      include ActiveModel::Validations
      include Iso4217::Validator
      attr_accessor :code, :code_or_nil
      
      validates :code, iso4217Code: true 
      
      def initialize(attrs = {})
        I18n.enforce_available_locales = false # added to avoid a deprecation message
        attrs.each_pair { |k,v| send("#{k}=", v) }
      end
    end
   
    class SampleModelWithNil
      include ActiveModel::Validations
      include Iso4217::Validator
      attr_accessor :code
      
      validates :code, iso4217Code: { message: "custom message"}, allow_nil: true
      
      def initialize(attrs = {})
        I18n.enforce_available_locales = false # added to avoid a deprecation message
        attrs.each_pair { |k,v| send("#{k}=", v) }
      end
    end
   
    class Iso4217ValidatorTests < Minitest::Test
      def test_valid_code
        m = SampleModel.new(code: 'EUR')
        assert m.valid?
      end
      
      def test_code_in_lowercase
        m = SampleModel.new(code: 'eur')
        assert m.invalid?
        
      end
      
      def test_invalid_code
        m = SampleModel.new(code: 123)
        assert m.invalid?
      end
      
      def test_nil_code
        m = SampleModel.new(code: nil)
        assert m.invalid?
      end
      
      def test_not_assigned
        m = SampleModel.new
        assert m.invalid?
      end
      
      def test_not_assigned_in_sample_code_with_nil 
        m = SampleModelWithNil.new
        assert m.valid?
      end
      
      def test_custom_message 
        m = SampleModelWithNil.new(code: "invalid")
        m.valid?
        assert_equal 'custom message', m.errors[:code][0]
      end
    end
    
  end
end