import argparse

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description = "Name for the parser")
    parser.add_argument("-c", "--cycles",type=int, default=0)

    options, unknown = parser.parse_known_args()

    args = parser.parse_args()