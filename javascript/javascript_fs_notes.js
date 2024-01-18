const fs = require("fs");

fs.writeFile()
fs.readFile()

fs.writeFileSync()
fs.readFileSync(filePath,{encoding:"utf8"})

fs.existsSync()

fs.mkdirSync()

// recursive read dir and files in current path
fs.readdirSync()

function fileExists(filePath) {
    try {
        return fs.statSync(filePath).isFile();
    } catch (err) {
        return false;
    }
}

function folderExists(filePath) {
    try {
        return fs.statSync(filePath).isDirectory();
    } catch (err) {
        return false;
    }
}