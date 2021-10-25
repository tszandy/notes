import traceback,sys


try:
    run()
except Exception:
    print("Exception in user code:")
    print("-"*60)
    traceback.print_exc(file = sys.stdout)
    print("-"*60)


