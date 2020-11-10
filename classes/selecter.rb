# frozen_string_literal: true

class Selecter
  attr_accessor :vm_arr

  def initialize(vm_arr = [])
    @vm_arr = vm_arr
  end

  def most_expensive(quantity = 1)
    @vm_arr.max_by(quantity, &:cost)
  end

  def cheapest(quantity = 1)
    @vm_arr.min_by(quantity, &:cost)
  end

  def most_voluminous_by_type(type, quantity = 1)
    @vm_arr.max_by(quantity) do |vm|
      culc_vol_by_type(vm, type)
    end
  end

  def most_add_hdd_by_quant(quantity = 1, type = nil)
    if type.nil?
      @vm_arr.max_by(quantity) do |vm|
        vm.addit_hdd.size
      end
    else
      @vm_arr.max_by(quantity) do |vm|
        arr_of_hdd = vm.addit_hdd.select do |hdd|
          hdd[:type] == type
        end
        arr_of_hdd.size
      end
    end
  end

  def most_add_hdd_by_vol(quantity = 1, type = nil)
    if type.nil?
      @vm_arr.max_by(quantity) do |vm|
        volum = 0
        vm.addit_hdd.each do |hdd|
          volum += hdd[:capacity]
        end
        volum
      end
    else
      @vm_arr.max_by(quantity) do |vm|
        volum = 0
        vm.addit_hdd.select do |hdd|
          volum += hdd[:capacity] if hdd[:type] == type
        end
        volum
      end
    end
  end

  def culc_vol_by_type(vm, type)
    volum = 0

    # Добавляем объем основного hdd VM если условие true
    volum += vm.hdd_capacity if vm.hdd_type == type

    # Добавляем объем дополнительных hdd VM если условие true
    vm.addit_hdd.each do |hdd|
      volum += hdd[:capacity] if hdd[:type] == type
    end
    volum
  end
end
