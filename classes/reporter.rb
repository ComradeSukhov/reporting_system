class Reporter
  attr_accessor :data
  def initialize(data)
    @data = data
  end

  def most_expensive_report
    header
    puts "#{@data.size} самых дорогих ВМ"
    space_x_3
    @data.each do |vm|
      vm_main_report(vm)
    end
  end

  def cheapest_report
    header
    puts "#{@data.size} самых дешевых ВМ"
    space_x_3
    @data.each do |vm|
      vm_main_report(vm)
    end
  end

  def most_voluminous_by_type_report(type)
    header
    puts "#{@data.size} самых объемных ВМ по параметру #{type} ВМ"
    space_x_3
    @data.each do |vm|
      volum = Selecter.new
      volum.culc_vol_by_type(vm, type)
      puts "Объем дисков #{type} ВМ = #{volum}"
      vm_main_report(vm)
    end
  end

  def most_add_hdd_by_quant_report
    header
    puts "#{@data.size} ВМ у которых подключено больше всего дополнительных дисков по количеству"
    puts "с учетом типа диска если параметр hdd_type указан"
    space_x_3
    @data.each do |vm|
      puts "Количество дисков ВМ = #{vm.addit_hdd.size}"
      puts "\n\r"
      vm_main_report(vm)
    end
  end

  def most_add_hdd_by_vol_report
    header
    puts "#{@data.size} ВМ у которых подключено больше всего дополнительных дисков по объему"
    puts "с учетом типа диска если параметр hdd_type указан"
    space_x_3
    @data.each do |vm|
      vm_main_report(vm)
    end
  end

  private

  def vm_main_report(vm)
    puts "Стоимость ВМ: #{vm.cost}"
      puts "Идентификатор ВМ: #{vm.id}"
      puts "Количество CPU в ВМ в штуках:               #{vm.cpu}"
      puts "Количество оперативной памяти в гигабайтах: #{vm.ram}"
      puts "Тип жесткого диска:                         #{vm.hdd_type}"
      puts "Объем жесткого диска:                       #{vm.hdd_capacity}"
      puts "\n\r"
      puts "\n\r"
      puts "-------------------------------------------"
      puts "\n\r"
      puts "\n\r"
  end

  def header
    puts '          Отчет'
    puts "\n\r"
  end

  def space_x_3
    puts "\n\r"
    puts "\n\r"
    puts "\n\r"
  end

end