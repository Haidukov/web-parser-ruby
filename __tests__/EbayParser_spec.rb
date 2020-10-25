require 'minitest/autorun'
require_relative '../src/EbayParser'

describe EbayParser do
    before do
        @parser = EbayParser.new('test')
        @parser.instance_variable_set(:@page, File.read("#{__dir__}/fixtures/ebayPage.html"))
    end

    it 'should correctly parse website' do
        results = @parser.parse
        assert_equal results.length, 31
    end
end