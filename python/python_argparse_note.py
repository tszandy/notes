import argparse

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description = "Name for the parser")
    parser.add_argument('filename')           # positional argument
    parser.add_argument("-c", "--cycles",type=int, default=0)

    options, unknown = parser.parse_known_args()

    args = parser.parse_args()


""" # prog.py
import argparse

parser = argparse.ArgumentParser(description='Process some integers.')
parser.add_argument('integers', metavar='N', type=int, nargs='+',
                    help='an integer for the accumulator')
parser.add_argument('--sum', dest='accumulate', action='store_const',
                    const=sum, default=max,
                    help='sum the integers (default: find the max)')

args = parser.parse_args()
print(args.accumulate(args.integers))
"""

"""
python prog.py -h
usage: prog.py [-h] [--sum] N [N ...]

Process some integers.

positional arguments:
 N           an integer for the accumulator

options:
 -h, --help  show this help message and exit
 --sum       sum the integers (default: find the max)
"""
