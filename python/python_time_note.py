# python time library
import time

# return time in seconds since the Epoch
"""
output:
time(float) second 
"""
time.time()

# return time in format string
"""
input:
time(float) second default:time.time()
output:
time in well format string
"""
time.ctime(time.time())

# convert float time to structure time of 9 items
"""
input:
time(float) second default:time.time()
output:
time.struct_time(tm_year=2021, tm_mon=10, tm_mday=25, tm_hour=10, tm_min=56, tm_sec=35, tm_wday=0, tm_yday=298, tm_isdst=1)
"""
time.localtime(time.time())

# convert structure time of 9 items to float time
"""
input:
time.struct_time(tm_year=2021, tm_mon=10, tm_mday=25, tm_hour=10, tm_min=56, tm_sec=35, tm_wday=0, tm_yday=298, tm_isdst=1)
output:
time(float) second default:time.time()
"""
time.mktime()

# convert tuple time to well format string
"""
input:
time.struct_time(tm_year=2021, tm_mon=10, tm_mday=25, tm_hour=10, tm_min=56, tm_sec=35, tm_wday=0, tm_yday=298, tm_isdst=1)
output:
time in well format string
"""
time.asctime()

# sleep n seconds
time.sleep(n)
