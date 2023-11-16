import csv

# open(file, mode='r', buffering=-1, encoding=None, errors=None, newline=None, closefd=True, opener=None)
with open('filename.csv',newline = '') as csv_file_handerler:
    csv_reader = csv.reader(csv_file_handerler,delimiter=' ',quotechar='|')
    csv_dict_reader = csv.DictReader(csv_file_handerler,delimiter=",")
    for row in csv_reader:
        print(', '.join(row))

with open('filename.csv',newline = '') as csv_file_handerler:
    csv_writer = csv.writer(csv_file_handerler,delimiter=' ',quotechar='|')
    csv_writer.writerow(output_list)
