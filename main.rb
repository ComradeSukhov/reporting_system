require_relative 'classes/csv_reader'
require_relative 'classes/vm'
require_relative 'classes/costmanager'
require_relative 'classes/selecter'
require_relative 'classes/reporter'
require_relative 'classes/report_controller'

report = ReportController.new
report.most_expensive(10)
report.cheapest(10)
report.most_voluminous_by_type('sata', 10)
report.most_add_hdd_by_quant(10)
report.most_add_hdd_by_vol(10)
