require 'minitest/autorun'
require 'csv'
require_relative '../src/CsvOutput'
require_relative '../src/ShoppingItem'

describe CsvOutput do
    before do
        @filePath = 'test.csv'
        @output = CsvOutput.new(@filePath)
    end

    it 'should print data to csv file' do
        item1 = ShoppingItem.new(1, 'product1', 1000)
        item2 = ShoppingItem.new(2, 'product2', 2000)
        mockData = [item1, item2]
        @output.print(mockData)
        parsed = CSV.read(@filePath)

        assert_equal parsed[1][0], '1'
        assert_equal parsed[1][1], 'product1'
        assert_equal parsed[1][2], '1000'

        assert_equal parsed[2][0], '2'
        assert_equal parsed[2][1], 'product2'
        assert_equal parsed[2][2], '2000'
    end

    after do
        File.delete(@filePath) if File.exist?(@filePath)
    end
end