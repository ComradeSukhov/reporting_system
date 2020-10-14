require_relative 'classes/csv_reader'
require_relative 'classes/vm'
require_relative 'classes/costmanager'
require_relative 'classes/selecter'

vm_confs    = CsvReader.new('02_ruby_vms.csv').read
vol_confs   = CsvReader.new('02_ruby_volumes.csv').read
price_confs = CsvReader.new('02_ruby_prices.csv').read

vms = VM.new_array(vm_confs, vol_confs)

# Set price for each VM
cost_manager = CostManager.new(vms,price_confs).set_cost

selecter = Selecter.new(vms)
p selecter.most_add_hdd_by_vol(5, 'sas')
