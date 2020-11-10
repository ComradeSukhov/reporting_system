# frozen_string_literal: true

class ReportController
  def initialize; end

  def most_expensive(quantity = 1)
    read_csv

    vms = VM.new_array(@vm_confs, @vol_confs)

    # Устанавливаем цену для каждой ВМ
    cost_manager = CostManager.new(vms, @price_confs)
    cost_manager.set_cost

    selecter           = Selecter.new(vms)
    vms_most_expensive = selecter.most_expensive(quantity)

    report = Reporter.new(vms_most_expensive)
    report.most_expensive_report
  end

  def cheapest(quantity = 1)
    read_csv

    vms = VM.new_array(@vm_confs, @vol_confs)

    # Устанавливаем цену для каждой ВМ
    cost_manager = CostManager.new(vms, @price_confs)
    cost_manager.set_cost

    selecter     = Selecter.new(vms)
    vms_cheapest = selecter.cheapest(quantity)

    report = Reporter.new(vms_cheapest)
    report.cheapest_report
  end

  def most_voluminous_by_type(type, quantity = 1)
    read_csv

    vms = VM.new_array(@vm_confs, @vol_confs)

    # Устанавливаем цену для каждой ВМ
    cost_manager = CostManager.new(vms, @price_confs)
    cost_manager.set_cost

    selecter                    = Selecter.new(vms)
    vms_most_voluminous_by_type = selecter.most_voluminous_by_type(type, quantity)

    report = Reporter.new(vms_most_voluminous_by_type)
    report.most_voluminous_by_type_report(type)
  end

  def most_add_hdd_by_quant(quantity = 1, type = nil)
    read_csv

    vms = VM.new_array(@vm_confs, @vol_confs)

    # Устанавливаем цену для каждой ВМ
    cost_manager = CostManager.new(vms, @price_confs)
    cost_manager.set_cost

    selecter                  = Selecter.new(vms)
    vms_most_add_hdd_by_quant = selecter.most_add_hdd_by_quant(quantity, type)

    report = Reporter.new(vms_most_add_hdd_by_quant)
    report.most_add_hdd_by_quant_report
  end

  def most_add_hdd_by_vol(quantity = 1, type = nil)
    read_csv

    vms = VM.new_array(@vm_confs, @vol_confs)

    # Устанавливаем цену для каждой ВМ
    cost_manager = CostManager.new(vms, @price_confs)
    cost_manager.set_cost

    selecter                = Selecter.new(vms)
    vms_most_add_hdd_by_vol = selecter.most_add_hdd_by_vol(quantity, type)

    report = Reporter.new(vms_most_add_hdd_by_vol)
    report.most_add_hdd_by_vol_report
  end

  def read_csv
    @vm_confs    = CsvReader.new('02_ruby_vms.csv').read_vm_confs
    @vol_confs   = CsvReader.new('02_ruby_volumes.csv').read_vol_confs
    @price_confs = CsvReader.new('02_ruby_prices.csv').read_vm_prices
  end
end
