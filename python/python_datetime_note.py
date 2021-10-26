# basic date and time types

import datetime

datetime.date(year, month, day)

datetime.time(hour, minute, second, microsecond, tzinfo)

datetime.datetime(year, month, day, hour, minute, second, microsecond, tzinfo)

# different between two date,time or datetime instance
datetime.timedelta(datetime_instance_1,datetime_instance_2)

# abstract base class for timezone info
datetime.tzinfo

# inplementation of tzinfo
datetime.timezone
