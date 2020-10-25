require 'csv'

class CsvOutput
    def initialize(path)
        @path = path
    end

    def print(results)
        CSV.open(@path, 'wb') do |csv|
            csv << ['index', 'name', 'price']
            results.each do |result|
                csv << [result.index, result.name, result.price]
            end
        end
    end
end
