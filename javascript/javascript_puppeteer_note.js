// npm install puppeteer

const puppeteer = require('puppeteer');

// get maximum screen browser
const browser = await puppeteer.launch({ headless: false ,defaultViewport: null,args: ['--start-maximized'] });

// grab first page
const pages_object = (await browser.pages());
let page;
if (pages_object.length>0){
    page = (await browser.pages())[0];
}

