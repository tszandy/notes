import csv

# open(file, mode='r', buffering=-1, encoding=None, errors=None, newline=None, closefd=True, opener=None)
with open('filename.csv',newline = '') as csv_file_handerler:
    row_reader = csv.reader(csv_file_handerler,delimiter=' ',quotechar='|')
    for row in row_reader:
        print(', '.join(row))

