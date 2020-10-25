require 'open-uri'
require 'nokogiri'
require_relative 'ShoppingItem.rb'

class EbayParser
    @@baseUrl = 'https://www.ebay.com/'
    def initialize(url)
        @url = @@baseUrl + url
    end

    def fetch
        puts('Fetching website ' + @url)  
        @page = URI.open(@url)
    end

    def parse
        puts('Parsing website ' + @url)

        doc = Nokogiri::HTML(@page)

        results = doc.css('.s-item').map.with_index { |gridCell, index|
            title = gridCell.at_css('.s-item__title').text
            price = gridCell.at_css('.s-item__price').text
            ShoppingItem.new(index, title, price)
        
        }
        return results
    end
end