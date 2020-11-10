# Система отчетов
Программа на Ruby реализующая систему отчетов по коллекции вычислительных машин.  

### Классы:
##### CsvReader
###### - аргументы (имя csv файла лежащего в папке csv_db)
Читает CSV файл, преобразуя строки с числовыми значениями в тип данных integer.
В зависимости от выбора метода для обработки CSV файла он будет обработан либо как файл конфигураций ВМ, либо как файл цен, либо как файл дополнительных жестких дисков.

##### VM
###### - аргументы (конфигурация для ВМ, конфигурации для дополнительных дисков - опционально)
###### конфигурация для ВМ в виде хэша:
     {
       id: id,                    - Integer
       cpu: cpu,                  - Integer
       ram: ram,                  - Integer
       hdd_type: hdd_type,        - String
       hdd_capacity: hdd_capacity - Integer
     }  

Создает объект ВМ или массив объектов ВМ.
Создание ВМ:  
     VM.new(vm_conf, vol_confs)
Создание массива ВМов:  
     VM.new_array(vm_confs, vol_confs)

##### CostManager  
###### - аргументы (объект ВМ или массив объектов ВМ, хэш с ценами)  

Записывает цену VM в пременную объекта VM.
Применив метод set_cost записывает в переменную объекта VM его цену учитывая его дополнительные диски.

##### Selecter
###### - аргументы (массив ВМов)  

Выбирает объекты VM из массива VM объектов. Конфигурация поиска осуществляется выбором соответствующего метода.

##### Reporter
###### - аргументы (массив ВМов)  

Формирует и выводит отчет в STDOUT.

##### ReportController  

Главный класс который управляет всем процессом создания отчета для пользователья, то есть в зависимости от требуемого отчета создает соответствующую выборку и формирует соответствующие отчеты.
