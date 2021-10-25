import logging

#store loggging file in ~/filename.log with encoding utf-8 and anything above log level logging DEBUG which is everything.
logging.basicConfig(filename="filename.log",encoding="utf-8",level = logging.DEBUG)
logging.debug()
logging.info()
logging,warning()
logging.error()
logging.critical()

# One logger go to one file_handler, one logger go to different file_handle with different log level.
file_handler = logging.FileHandler(filename = "filename.log")
file_handler.setLevel(logging.DEBUG)
file_handler.set_name()


format_string = "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
formatter = logging.formatter(format_string)

file_handler.setFormatter(formatter)



logger = logging.getLogger()
logger.addHandler(file_handler)



logging.StreamHandler()

try:
    run()
except:
    logging.exception('Got exception on main handler')
    raise

#logging level
level:numeric_value
CRITICAL : 50
ERROR    : 40
WARNING  : 30
INFO     : 20
DEBUG    : 10
NOTSET   :  0
