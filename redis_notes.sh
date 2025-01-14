# set key value
SET ${key} ${value}

# get key
GET ${key}

# return 1 if ${key} exists, 0 otherwise
EXISTS ${key}

# return all keys
KEYS *

# clear all cache
flushall

# time to live of a ${key}
ttl ${key}

# set a ${key} to expire in 10 seconds
expire ${key} 10

# set key value with expiration of 10 seconds 
setex ${key} 10 ${value}

# left push to a array
lpush ${key} ${value}

# right push to a array
rpush ${key} ${value}

# left pop from a array
lpop ${key}

# right pop from a array
rpop ${key}

# print the whole array
lrange ${key} 0 -1

# set add 
sadd ${key} ${value}

# set remove 
srem ${key} ${value}

# print out memebers of a set ${key}
smembers ${key}

# hash
