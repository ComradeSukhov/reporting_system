class VM
  attr_reader :id, :cpu, :ram, :hdd_type, :hdd_capacity, :add_hdd
  def initialize(vm_conf, vol_confs = [])
    @id           = vm_conf[0]
    @cpu          = vm_conf[1]
    @ram          = vm_conf[2]
    @hdd_type     = vm_conf[3]
    @hdd_capacity = vm_conf[4]
    @addit_hdd    = vol_confs
  end

  # Классовый метод который возвращает массив инстансов вычислительных машин
  # Аргумент vm_confs ожидается в виде 2-мерного массива
  def self.new_array(vm_confs, vol_confs = 0)
    vm_confs.map do |vm_conf|
      vm_id = vm_conf[0] 
      VM.new(vm_conf, addit_hdd(vol_confs, vm_id))
    end
  end

  # Классовый метод который возвращает 2-мерный массив где каждый элемент это конфигурация
  # дополнительного hdd
  # Аргумент vol_confs ожидается в виде 2-мерного массива.
  def self.addit_hdd(vol_confs, vm_id)
    hdd_arr = vol_confs.select do |vol_conf|
                vol_conf_vm_id  = vol_conf[0]
                vol_conf_vm_id == vm_id
              end
              
    # Убираем из конфигураций hdd айдишник VM которому принадлежит hdd
    hdd_arr.map do |hdd|
        hdd = [hdd[1], hdd[2]]
    end
  end

end