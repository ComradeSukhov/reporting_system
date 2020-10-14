class Selecter
  def initialize(vm_arr)
    @vm_arr = vm_arr
  end

  def most_expensive(quantity = 1)
    @vm_arr.max_by(quantity) { |vm| vm.cost }
  end

  def cheapest(quantity = 1)
    @vm_arr.min_by(quantity) { |vm| vm.cost }
  end

  def most_voluminous_by_type(quantity = 1, type)
    @vm_arr.max_by(quantity) do |vm|
      volum = 0

      # Добавляем объем основного hdd VM если условие true
      volum += vm.hdd_capacity if vm.hdd_type == type

      # Добавляем объем дополнительных hdd VM если условие true
      vm.addit_hdd.each do |hdd|
        hdd_type     = hdd.select { |parametr| parametr.class == String }[0]
        hdd_capacity = hdd.select { |parametr| parametr.class == Integer }[0]

        volum += hdd_capacity if hdd_type == type
      end

      volum
    end
  end

  def most_add_hdd_by_quant(quantity = 1, type = nil)
    if type == nil
      @vm_arr.max_by(quantity) do |vm|
        vm.addit_hdd.size
      end
    else
      @vm_arr.max_by(quantity) do |vm|
        arr_of_hdd = vm.addit_hdd.select do |hdd|
                       hdd_type = hdd.select { |parametr| parametr.class == String }[0]
                       hdd_type == type
                     end
        arr_of_hdd.size
      end
    end
  end

  def most_add_hdd_by_vol(quantity = 1, type = nil)
    if type == nil
      @vm_arr.max_by(quantity) do |vm|
        volum = 0
        vm.addit_hdd.each do |hdd|
          hdd_capacity = hdd.select { |parametr| parametr.class == Integer }[0]
          volum += hdd_capacity
        end
      end
    else
      @vm_arr.max_by(quantity) do |vm|
        volum = 0
        vm.addit_hdd.select do |hdd|
          hdd_type     = hdd.select { |parametr| parametr.class == String }[0]
          hdd_capacity = hdd.select { |parametr| parametr.class == Integer }[0]

          volum += hdd_capacity if hdd_type == type
        end
      end
    end
  end

end