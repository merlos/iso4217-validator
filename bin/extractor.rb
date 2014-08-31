#!/bin/ruby

# Simple code list extractor
#
# This file gets the list of codes from a CSV file
#
# NOTE
# This tool is intended to be used by the gem administrators
# 
# It expects a csv file in which there is a column where the 
# currency codes of ISO4417 are defined. 
# You can find an example here:
# http://www.currency-iso.org/en/home/tables/table-a1.html
#
# The source file previously mentioned is an XLS (Excel), it has to be 
# converted into CSV in order to be processed by this script
#
# In the ISO4217 table-a1 there are several currencies that are repeated.
# basically this script just removes those duplicated.
#
# How to use the script:
# 
# 1) Change the config vars below
# 2) Run the script:
#      $ ruby extractor.rb
#
# 3) copy @output_file (def: tmp/valid_codes.rb) into lib/iso4217/validator/
# 
# Use tmp/ directory for the files, as it is already ignored on the git repository
# 
# if you get this error:
#       invalid byte sequence in UTF-8 (ArgumentError)
# You need to convert the file to UTF-8
#    $ iconv -f ISO-8859-1 -t utf-8 table_a1.csv > table_a1_utf8.csv 

#################################
# Config 
###################################
#
# path to the csv file with the codes
@csv_file_path = '../tmp/table_a1.csv'
#
# output file path. Do not change the name "valid_codes.rb"
@output_file = '../tmp/valid_codes.rb'
#
# first row with a code
@first_row = 4 # starts in 1
#
# column in which the codes are
@column = 2; # starts in 0, so this is the actual 4th row

@separator = ';'
############################################



require 'csv'
code_list = []
current_row_num = 0
CSV.foreach(@csv_file_path, {col_sep: @separator}) do |row|
  current_row_num+= 1
  if (current_row_num > @first_row)
    if code_list.include? (row[@column]) 
      next
    end
    code_list.push(row[@column]) unless row[@column].nil? 
  end
  
end 

# now create the output ruby file
f = File.new(@output_file,  "w+")
f.puts "module Iso4217"
f.puts "  module Validator"
f.puts "   Iso4217Codes = ["
code_list.each_with_index do |code, index| 
  line = "    \"#{code}\"" 
  line = line + ',' if code != code_list.last
  f.puts line
end
f.puts "   ]"
f.puts "  end"
f.puts "end"
f.close


