require 'selenium-webdriver'
require 'csv'

options = Selenium::WebDriver::Chrome::Options.new
options.add_argument('--headless')
driver = Selenium::WebDriver.for(:chrome, options: options)

driver.get 'https://quotes.toscrape.com/js/'

# ---------------------------------------------------------------
# ##################### 1° versão ###############################
# ---------------------------------------------------------------
#        saving in memory before writing in csv file


# quotes = []
# while true
#   quote_container = driver.find_elements(css: '.quote')
#   quote_container.each do |quote_el|
#     quote_text = quote_el.find_element(css: '.text').attribute('textContent')
#     author = quote_el.find_element(css: '.author').attribute('textContent')
#     quotes << [quote_text, author]
#   end
#   begin
#     driver.find_element(css: '.next >a').click
#   rescue StandardError
#     break # Next button not found
#   end
# end

# CSV.open(
#   "quotes.csv",
#   "w+",
#   write_headers: true,
#   headers: %w[Quote Author]
# ) do |csv|
#   quotes.each do |quote|
#     csv << quote
#   end
# end



# ---------------------------------------------------------------
# ##################### 2° versão ###############################
# ---------------------------------------------------------------
#             Writing in csv as it is scraping

# datetime = Time.now.strftime("%Y-%d-%m_%H-%M-%S")

# CSV.open(
#   "quotes_#{datetime}.csv",
#   "w+",
#   write_headers: true,
#   headers: %w[Quote Author]
# ) do |csv|
#   while true
#     quote_container = driver.find_elements(css: '.quote')
#     quote_container.each do |quote_el|
#       quote_text = quote_el.find_element(css: '.text').attribute('textContent')
#       author = quote_el.find_element(css: '.author').attribute('textContent')
#       csv << [quote_text, author]
#     end
#     begin
#       driver.find_element(css: '.next >a').click
#     rescue StandardError
#       break # Next button not found
#     end
#   end
# end