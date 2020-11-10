# frozen_string_literal: true

class VM
  attr_accessor :cost
  attr_reader :id, :cpu, :ram, :hdd_type, :hdd_capacity, :addit_hdd

  def initialize(vm_conf, vol_confs = [])
    @id           = vm_conf[:id]
    @cpu          = vm_conf[:cpu]
    @ram          = vm_conf[:ram]
    @hdd_type     = vm_conf[:hdd_type]
    @hdd_capacity = vm_conf[:hdd_capacity]
    @addit_hdd    = vol_confs
    @cost         = nil
  end

  # Классовый метод который возвращает массив инстансов вычислительных машин
  # Аргумент vm_confs ожидается в виде массива где настройки для каждой vm это хэш
  def self.new_array(vm_confs, vol_confs = [])
    vm_confs.map do |vm_conf|
      vm_id = vm_conf[:id]
      VM.new(vm_conf, addit_hdd(vol_confs, vm_id))
    end
  end

  private
  
  # Классовый метод который возвращает массив где каждый элемент это конфигурация
  # дополнительного hdd в виже хэша
  def self.addit_hdd(vol_confs, vm_id)
    vol_confs.select do |vol_conf|
      vol_conf[:id] == vm_id
    end
  end
end
