# Iso4217::Validator

Simple ruby on rails validator that checks if a value is a valid [ISO4217, http://en.wikipedia.org/wiki/ISO_4217] code. 

Examples of ISO4217 codes: EUR, USD, CHF, TWD, INR.

## Installation

Add this line to your application's Gemfile:

    gem 'iso4217-validator'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iso4217-validator

## Usage

You need to include the validator in your model: 

'''ruby
  class TestModel < ActiveRecord::Base
    include Iso4417::Validator
    validates :currency_code, iso4417Code: true 
  end
'''  

If the currency code is invalid it launches an :invalid message, if you want to customize the message you can use:

''' ruby
  class TestModel < ActiveRecord::Base
    include Iso4417::Validator
    validates :currency_code, iso4417Code: {message: 'custom message'}
  end
  
'''
## Contributing

1. Fork it ( http://github.com/merlos/iso4217-validator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature with tests'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

Please add unit tests when including new features. 

### Maintaining the list updated
This is the source of the valid code list: http://www.currency-iso.org/en/home/tables/table-a1.html
This file was updated in August 15, 2014.

The script bin/extractor.rb can extract the codes from the excel file after
converting it in a csv file. You can find the instructions within the extractor.rb file.



## License

Copyright (c) 2014 Juan M. Merlos under MIT License
