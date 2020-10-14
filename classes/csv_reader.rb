class CsvReader
  require 'csv'

  def initialize(csv_file_name)
    # Создаем переменную с путем до CSV файла
    @csv_file_dir = "csv_db/#{csv_file_name}"
  end

  # CSV.open возвращает 2-мерный массив
  def read
    csv = CSV.open(@csv_file_dir)
    csv.map { |arr| reveal_integers(arr) }
  end

  private

  # Меняет на числа те строки, который выражают собой числа
  def reveal_integers(arr)
    arr.map { |val| val.match?(/\A\d+\z/) ? val.to_i : val }
  end

end