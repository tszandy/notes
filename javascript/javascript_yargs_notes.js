const yargs = require('yargs/yargs')
const { hideBin } = require('yargs/helpers')
const argv = yargs(hideBin(process.argv))
    .option(long_name,{
        alias: shortname,
        describe: description,
        default: default_value,
        type: value_type
    })
    .help("help")
    .alias("help","H")
    .argv

type
"string"
"boolean"
""