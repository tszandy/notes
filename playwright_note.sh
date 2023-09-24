npm init playwright@latest

npm playwright -v

# show all the options
npx playwright --help

# run all tests
npx playwright test

# show report after run tests
npx playwright show-report

# run specific test file
npx playwright test ${test_file_path}

# run test with partial name
npx playwright test ${partial_name}

# run on specific browser 
npx playwright test --project=chromium

# run tests in headed mode (real browser appear during the test)
npx playwright test --headed

# run test with debug
npx playwright test --debug

# debug specific test file
npx playwright test ${test_file_path} --debug

# debug specific test file with line number
npx playwright test ${test_file_path}:${line_number} --debug


# playwright Codegen test generator
npx playwright codegen

npx playwright codegen --browser ${browser_name}

# playwright record to target
npx playwright codegen --browser ${browser_name} --target javascript -o ${new_test_file_path}

npx playwright codegen --viewport-size=800,600

npx playwright codegen --device="iPhone 11"

npx playwright codegen --color-scheme=dark

npx playwright codegen --help


# record track when test failed.
playwright.config.ts
set config 
{
    retries: 1,
    use:{
        trace: 'on-first-retry'
    }
}
# trace options
"on-first-retry"
"on"
"off"
"retain-on-failure"

# set trace on from command line
npx playwright test --trace on

# analyze trace
npx playwright show-trace trace.zip


await page.screentshot({path:`screenshot/${browserName_screenshot.png}`})


await page.locator(your_selector).count()
await page.locator(your_selector).isVisible()
await page.locator(your_selector).click()
await page.locator(your_selector).fill(${fill_string})

# object property selector
your_selector = 'id=user-name'
your_selector = '[id="user-name"]'

# use css selector
css_selector = '#login-button'

# use xpath selector
xpath_selector = 'xpath=//input[@name="password"]'
xpath_selector = '//input[@name="password"]'

# use text selector
text_select = 'text=LOGIN'
text_select = ':has-text("LOGIN")'

