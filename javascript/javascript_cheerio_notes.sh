# parse html data
npm install cheerio

const cheerio = require("cheerio")

const DOM = cheerio.load(HTML_String)

const $ = cheerio.load(fs.reafFileSync(html_file_path))

# get element from tag name
$(`${tag_name}`)

# get element from specific attribute value
$(`[${attribute_name}=${attribute_value}]`)

# get element from specific class name
$(`.${class_name}`)

# get element from specific id
$(`#${id}`)
