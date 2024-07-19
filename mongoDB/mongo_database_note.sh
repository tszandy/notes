https://www.mongodb.com/try/download/community

# connect to mongodb using mongo shell
https://www.mongodb.com/try/download/shell

# mac install mongo shell
brew install mongoshell

# login into mongodb
mongosh mongodb://root:example@localhost:27017
mongosh --port 27017 -u "root" -p "example"

mongosh --host "localhost" --port 27017 -u "ice" -p "example"
mongosh --host "localhost" --port 27017 -u "ice" --authenticationDatabase "database1" -p "example"
mongosh mongodb://ice:example@localhost:27017/database1

# to display databases
show dbs
show databases

# to display collections
show collections

# to display profile
show profile

# to display roles
show roles

# to display log
show log

# to display logs
show logs

# to use/create database ${database_name}
use ${database_name}

# create collection ${collection_name}
db.createCollection(${collection_name})

# get a list of all existing users
db.getUsers()

# create user
db.createUser(
    {
        "user":"ice",
        "pwd":"example",
        roles: [
            { 
                role: "readWrite", db: "database1"
            }
        ]
    }
)

# drop user
db.dropUser("ice")

# mongodb roles

# display show command options
show.help()

# display db command options
db.help()
