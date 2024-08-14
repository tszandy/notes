# Specify a User Agent:
curl -A "CustomUserAgent/1.0" http://example.com

# Send Additional Headers:
curl -H "Authorization: Bearer TOKEN" http://example.com

# To send data with a POST request:
curl -X POST -d "param1=value1&param2=value2" http://example.com/resource

# POST JSON Data
curl -X POST -H "Content-Type: application/json" -d '{"key1":"value1", "key2":"value2"}' http://example.com/resource
