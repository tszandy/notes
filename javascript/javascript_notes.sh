"type": "module", "commonjs"


.mjs # ES modules file
import fs from "fs";
export { function };

.cjs # CommonJS file
const fs = require("fs");
module.exports = { function1, function2 };

# set variable
var set_variable = new Set();
set_variable.add(1)
set_variable.add(2)

set_variable.add(element);
Array.from(set_variable);

# map variable
var map_variable = new Map();
map_variable.set(1,1)
map_variable.set(2,2)

map_variable.set(key,value);
map_variable.get(key);
map_variable.keys();
Array.from(map_variable.keys());

# get typeof variable
typeof(variable)


# clone array
array=[1,2,3]
clone_array=[...array]


# logging package
winston
