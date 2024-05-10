require "open-uri"
require "nokogiri"
require "csv"

def scraping(url)
  # getting DOM in text format
  html = URI.open("#{url}").read
  # parsing text into DOM Object
  document_object = Nokogiri::HTML(html)
  data_scrapped = []

  # Scraping data using css selectors
  document_object.search("ul li .text-center a").each do |element, index|
    content = element.text.strip
    url = element["href"]
    item = {:content => content, :url => url}
    data_scrapped << item
  end

  data_scrapped.each_with_index do |element, index|
    puts "#{index + 1} - #{element[:content]} \n#{element[:url]}\n\n"
  end

  data_scrapped
end

data_scrapped = scraping("https://turbonative.directory/")

filepath = "turbo-apps.csv"
csv_options = {headers: :first_row, col_sep: ","}

CSV.open(filepath, "wb") do |csv|
  csv << ["index", "title", "url"]

  data_scrapped.each_with_index do |item, index|
    csv << [index, item[:content], item[:url]]
  end
end