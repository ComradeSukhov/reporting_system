# frozen_string_literal: true

class CsvReader
  require 'csv'

  def initialize(csv_file_name)
    # Создаем переменную с путем до CSV файла
    @csv_file_dir = "csv_db/#{csv_file_name}"
  end

  # Возвращает массив с хэшами каждый из которых это настройки для ВМ
  def read_vm_confs
    csv = read_csv
    csv.map do |arr|
      {
        id: arr[0],
        cpu: arr[1],
        ram: arr[2],
        hdd_type: arr[3],
        hdd_capacity: arr[4]
      }
    end
  end

  # Возвращает хэш со списком цен
  def read_vm_prices
    csv = read_csv
    csv_result = {}

    csv.each do |arr|
      csv_result[arr[0].to_sym] = arr[1]
    end

    csv_result
  end

  # Возвращает массив с хэшами где каждый хэш это hdd
  def read_vol_confs
    csv = read_csv
    csv.map do |arr|
      {
        id: arr[0],
        type: arr[1],
        capacity: arr[2]
      }
    end
  end

  private

  # CSV.open возвращает 2-мерный массив
  def read_csv
    csv = CSV.open(@csv_file_dir)
    csv.map { |arr| reveal_integers(arr) }
  end

  # Меняет на числа те строки, которые выражают собой числа
  def reveal_integers(arr)
    arr.map { |val| val.match?(/\A\d+\z/) ? val.to_i : val }
  end
end
