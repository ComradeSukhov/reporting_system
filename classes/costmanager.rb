# frozen_string_literal: true

class CostManager
  attr_accessor :data, :prices

  def initialize(data, prices)
    @data   = data
    @prices = prices
  end

  def set_cost
    if @data.instance_of?(Array)
      @data.each { |vm| vm.cost = calc_cost(vm) }
    else
      @data.cost = calc_cost(@data)
    end
  end

  def calc_cost(vm)
    cpu_price = @prices[:cpu]
    ram_price = @prices[:ram]
    hdd_price = @prices[vm.hdd_type.to_sym]

    cpu_cost     = cpu_price * vm.cpu
    ram_cost     = ram_price * vm.ram
    hdd_cost     = hdd_price * vm.hdd_capacity
    add_hdd_cost = clac_add_hdd(vm)

    cost = cpu_cost + ram_cost + hdd_cost + add_hdd_cost
    # Изначально цены установленны в копейках. Приводим цену к рублевому эквиваленту
    cost / 100
  end

  def clac_add_hdd(vm)
    add_hdd_costs = vm.addit_hdd.map do |hdd|
      hdd[:capacity] * @prices[hdd[:type].to_sym]
    end
    add_hdd_costs.sum
  end
end
