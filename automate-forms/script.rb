require "selenium-webdriver"
require "rspec"

describe "automating a form" do
  it "submits a form - happy path" do 
    driver = Selenium::WebDriver.for :chrome

    # Acessando uma URL
    # driver.get "https://formy-project.herokuapp.com/form"
    driver.navigate.to "https://formy-project.herokuapp.com/form"

    driver.find_element(id: "first-name").send_keys("Everson")
    driver.find_element(id: "last-name").send_keys("Soares")
    driver.find_element(id: "job-title").send_keys("Software Developer")

    driver.find_element(id: "radio-button-1").click
    driver.find_element(id: "checkbox-2").click

    # Desmarcar um checkbox ou Radio button ".clear"
    # driver.find_element(id: "checkbox-2").clear

    # Verificar se checkbox ou radiobutton está marcado
    # driver.find_element(id: "checkbox-2").selected?

    driver.find_element(css: "option[value='2']").click

    driver.find_element(id: "datepicker").send_keys("10/05/2024")
    driver.find_element(id: "datepicker").send_keys :return

    driver.find_element(css: ".btn.btn-lg.btn-primary").click

    wait = Selenium::WebDriver::Wait.new(timeot: 10) #segundos
    wait.until { driver.find_element(class: "alert") }
    expect(driver.find_element(class: "alert").text).to eql("The form was successfully submitted!")
    driver.quit
  end
end

# Executando
# rspec script.rb

# ou
# rspec script.rb --format html --out script.html -fd
# Vai exportar um código html onde podemos ver os resultados dos nossos testes no navegador