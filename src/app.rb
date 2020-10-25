require_relative 'EbayParser.rb'
require_relative 'CsvOutput.rb'

parser = EbayParser.new('b/Apple-MacBook-Pro-16-16-9-in-Screen/111422/bn_7117197171')

parser.fetch 

results = parser.parse

output = CsvOutput.new('../output/macbooks.csv')

output.print(results)