"type": "module", "commonjs"


.mjs # ES modules file
import fs from "fs";
export { function };

.cjs # CommonJS file
const fs = require("fs");
module.exports = { function1, function2 };


const set_variable = new Set();
set_variable.add(element);
Array.from(set_variable);

const map_variable = new Map();
map_variable.set(key,value);
map_variable.get(key);
map_variable.keys();
Array.from(map_variable.keys());

