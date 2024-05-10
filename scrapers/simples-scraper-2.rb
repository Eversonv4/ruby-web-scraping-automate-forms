require "open-uri"
require "nokogiri"
require "csv"

def scraping(url)
  document_object = Nokogiri::HTML.parse(URI.open("#{url}"))
  data_scrapped = []

  # o segundo parâmetro é uma segunda consulta no DOM, e assim por diante
  document_object.search("ul li .text-center a", "ul li .text-center p").each do |element, index|
    content = element.text.strip
    # url = element["href"]
    # item = {:content => content, :url => url}
    # data_scrapped << item
    data_scrapped << content
  end

  data_scrapped.each_with_index do |element, index|
    # puts "#{index + 1} - #{element[:content]} \n#{element[:url]}\n\n"
    puts element
  end

  data_scrapped
end

data_scrapped = scraping("https://turbonative.directory/")

# filepath = "turbo-apps.csv"
# csv_options = {headers: :first_row, col_sep: ","}

# CSV.open(filepath, "wb") do |csv|
#   csv << ["index", "title", "url"]

#   data_scrapped.each_with_index do |item, index|
#     csv << [index, item[:content], item[:url]]
#   end
# end