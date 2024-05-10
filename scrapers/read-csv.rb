require "csv"

arr_of_rows = CSV.open("turbo-apps.csv", "r")

arr_of_rows.each do |row|
  p "#{row[0]} - #{row[1]} - #{row[2]}"
end

=begin
    require "csv"

    # Verifica se foi passado um argumento de linha de comando
    if ARGV.empty?
      puts "Por favor, forneça o caminho para o arquivo CSV como um argumento."
      exit
    end

    # Lê o primeiro argumento como o caminho para o arquivo CSV
    csv_file_path = ARGV[0]

    # Abre o arquivo CSV
    arr_of_rows = CSV.open(csv_file_path, "r")

    arr_of_rows.each do |row|
      # Imprime cada linha do CSV
      puts "#{row[0]} - #{row[1]} - #{row[2]}"
    end
=end