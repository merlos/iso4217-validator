# Iso4217::Validator

Simple ruby on rails validator that checks if a value is a valid [ISO4217] (http://en.wikipedia.org/wiki/ISO_4217) code. 

Examples of ISO4217 codes: EUR, USD, CHF, TWD, INR.

## Installation

Add this line to your application's Gemfile:

    gem 'iso4217-validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iso4217-validator

## Usage

Include the validator in your model attribute this way: 

```ruby
  class TestModel < ActiveRecord::Base
    include Iso4217::Validator
    validates :currency_code, iso4217Code: true 
  end
```  

currency_code attribute shall be defined as an string.

If the currency_code is invalid the validator adds an :invalid message error. If you want to customize the error message you can use:

```ruby
  class TestModel < ActiveRecord::Base
    include Iso4217::Validator
    validates :currency_code, iso4217Code: {message: 'Oh! That's an invalid currency code.'}
  end
```

Please bear in mind that the validator is case sensitive. So 'EUR' is a valid code but 'eur' is not.

## Contributing

1. Fork it ( http://github.com/merlos/iso4217-validator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature with tests'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Please add unit tests when including new features. 

### Maintaining the list updated
Source of the valid code list used: http://www.currency-iso.org/en/home/tables/table-a1.html
The last version included in the gem: August 15, 2014.

The gem source includes an script (bin/extractor.rb) that can extract the codes from the excel file and convert it into the
ruby array which is used by the validator. You can find more instructions within the extractor.rb file.

## License

Copyright (c) 2014 Juan M. Merlos. Distributed under MIT License
