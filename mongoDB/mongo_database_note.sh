https://www.mongodb.com/try/download/community

# connect to mongodb using mongo shell
https://www.mongodb.com/try/download/shell

# user management
https://www.mongodb.com/docs/manual/reference/method/js-user-management/

# mac install mongo shell
brew install mongoshell

# login into mongodb
mongosh mongodb://root:example@localhost:27017
mongosh mongodb://root:example@localhost:27017/admin
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

# create role
db.createRole( { role: "Billing", privileges: [ { resource: { db: "test",
   collection: "medicalView" }, actions: [ "find" ] } ], roles: [ ] } )
db.createRole( { role: "Provider", privileges: [ { resource: { db: "test",
   collection: "medicalView" }, actions: [ "find" ] } ], roles: [ ] } )

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
db.createUser( {
   user: "James",
   pwd: "js008",
   roles: [
      { role: "Billing", db: "test" }
   ]
} )
db.createUser( {
   user: "Michelle",
   pwd: "me009",
   roles: [
      { role: "Provider", db: "test" }
   ]
} )

# create super user
use admin
db.createUser(
{
    user: "root",
    pwd: "password",
    roles: [ "root" ]
})

# update user role
db.updateUser(
    "ice",
    {
        roles: [
            { 
                role: "userAdmin", db: "database1"
            },
            { 
                role: "readWrite", db: "database1"
            }
        ]
    }
)

# grant role
db.grantRolesToUser(
    "ice",
    [
        { 
            role: "userAdmin", db: "database1"
        },
        { 
            role: "readWrite", db: "database1"
        }
    ]
)

# revoke role
db.revokeRolesFromUser(
    "ice",
    [
        { 
            role: "userAdmin", db: "database1"
        },
        { 
            role: "readWrite", db: "database1"
        }
    ]
)

# drop user
db.dropUser("ice")

# login as user
use admin
db.auth( "root", "example")
use database1
db.auth( "ice", "example" )

# get current user info
db.runCommand({connectionStatus : 1})

# mongodb roles

# display show command options
show.help()

# display db command options
db.help()
