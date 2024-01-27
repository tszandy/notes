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



function __promisify__
function __promisify__<TBuffer extends NodeJS.ArrayBufferView>
function access
function accessSync
function appendFile
function appendFileSync
function behaves like [`realpath
function callback
function chmod
function chmodSync
function chown
function chownSync
function close
function closeFd
function closeSync
function copyFile
function copyFileSync
function cp
function cpSync
function createReadStream
function createWriteStream
function exists
function existsSync
function fchmod
function fchmodSync
function fchown
function fchownSync
function fdatasync
function fdatasyncSync
function fstat
function fstatSync
function fsync
function fsyncSync
function ftruncate
function ftruncateSync
function futimes
function futimesSync
function lchmod
function lchmodSync
function lchown
function lchownSync
function link
function linkSync
function lstat
function lutimes
function lutimesSync
function mkdir
function mkdirSync
function mkdtemp
function mkdtempSync
function native
function open
function openAsBlob
function opendir
function opendirSync
function openSync
function read
function read<TBuffer extends NodeJS.ArrayBufferView>
function readdir
function readdirSync
function readFile
function readFileSync
function readlink
function readlinkSync
function readSync
function readv
function readvSync
function realpath
function realpathSync
function rename
function renameSync
function rm
function rmdir
function rmdirSync
function rmSync
function stat
function statfs
function statfsSync
function symlink
function symlinkSync
function truncate
function truncateSync
function unlink
function unlinkSync
function unwatchFile
function utimes
function utimesSync
function watch
function watchFile
function write
function write<TBuffer extends NodeJS.ArrayBufferView>
function writeFile
function writeFileSync
function writeSync
function writev
function writevSync
