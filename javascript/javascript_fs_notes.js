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

const { parse } = require("csv-parse");
// read csv file
fs.createReadStream(${csv_file_path})
    .pipe(parse({ delimiter: ",", from_line: 2 }))
    .on("data", function (row){
        console.log(row)
    })

fs.access
fs.accessSync
fs.appendFile
fs.appendFileSync
fs.chmod
fs.chmodSync
fs.chown
fs.chownSync
fs.close
fs.closeSync
fs.copyFile
fs.copyFileSync
fs.cp
fs.cpSync
fs.createReadStream
fs.createWriteStream
fs.exists
fs.existsSync
fs.fchmod
fs.fchmodSync
fs.fchown
fs.fchownSync
fs.fdatasync
fs.fdatasyncSync
fs.fstat
fs.fstatSync
fs.fsync
fs.fsyncSync
fs.ftruncate
fs.ftruncateSync
fs.futimes
fs.futimesSync
fs.lchmod
fs.lchmodSync
fs.lchown
fs.lchownSync
fs.link
fs.linkSync
fs.lstat
fs.lutimes
fs.lutimesSync
fs.mkdir
fs.mkdirSync
fs.mkdtemp
fs.mkdtempSync
fs.open
fs.openAsBlob
fs.opendir
fs.opendirSync
fs.openSync
fs.read
fs.readdir
fs.readdirSync
fs.readFile
fs.readFileSync
fs.readlink
fs.readlinkSync
fs.readSync
fs.readv
fs.readvSync
fs.realpath
fs.realpathSync
fs.rename
fs.renameSync
fs.rm
fs.rmdir
fs.rmdirSync
fs.rmSync
fs.stat
fs.statfs
fs.statfsSync
fs.symlink
fs.symlinkSync
fs.truncate
fs.truncateSync
fs.unlink
fs.unlinkSync
fs.unwatchFile
fs.utimes
fs.utimesSync
fs.watch
fs.watchFile
fs.write
fs.writeFile
fs.writeFileSync
fs.writeSync
fs.writev
fs.writevSync
