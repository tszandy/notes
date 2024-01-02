https://github.com/microsoft/playwright
https://playwright.dev/docs/intro
https://javadoc.io/doc/com.microsoft.playwright/playwright/latest/index.html

# initialize playwright project
npm init playwright@latest

# install playwright command globally
npm install -g playwright 

# show playwright version
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

Full list of available devices:
  "Blackberry PlayBook"
  "Blackberry PlayBook landscape"
  "BlackBerry Z30"
  "BlackBerry Z30 landscape"
  "Galaxy Note 3"
  "Galaxy Note 3 landscape"
  "Galaxy Note II"
  "Galaxy Note II landscape"
  "Galaxy S III"
  "Galaxy S III landscape"
  "Galaxy S5"
  "Galaxy S5 landscape"
  "Galaxy S8"
  "Galaxy S8 landscape"
  "Galaxy S9+"
  "Galaxy S9+ landscape"
  "Galaxy Tab S4"
  "Galaxy Tab S4 landscape"
  "iPad (gen 5)"
  "iPad (gen 5) landscape"
  "iPad (gen 6)"
  "iPad (gen 6) landscape"
  "iPad (gen 7)"
  "iPad (gen 7) landscape"
  "iPad Mini"
  "iPad Mini landscape"
  "iPad Pro 11"
  "iPad Pro 11 landscape"
  "iPhone 6"
  "iPhone 6 landscape"
  "iPhone 6 Plus"
  "iPhone 6 Plus landscape"
  "iPhone 7"
  "iPhone 7 landscape"
  "iPhone 7 Plus"
  "iPhone 7 Plus landscape"
  "iPhone 8"
  "iPhone 8 landscape"
  "iPhone 8 Plus"
  "iPhone 8 Plus landscape"
  "iPhone SE"
  "iPhone SE landscape"
  "iPhone X"
  "iPhone X landscape"
  "iPhone XR"
  "iPhone XR landscape"
  "iPhone 11"
  "iPhone 11 landscape"
  "iPhone 11 Pro"
  "iPhone 11 Pro landscape"
  "iPhone 11 Pro Max"
  "iPhone 11 Pro Max landscape"
  "iPhone 12"
  "iPhone 12 landscape"
  "iPhone 12 Pro"
  "iPhone 12 Pro landscape"
  "iPhone 12 Pro Max"
  "iPhone 12 Pro Max landscape"
  "iPhone 12 Mini"
  "iPhone 12 Mini landscape"
  "iPhone 13"
  "iPhone 13 landscape"
  "iPhone 13 Pro"
  "iPhone 13 Pro landscape"
  "iPhone 13 Pro Max"
  "iPhone 13 Pro Max landscape"
  "iPhone 13 Mini"
  "iPhone 13 Mini landscape"
  "iPhone 14"
  "iPhone 14 landscape"
  "iPhone 14 Plus"
  "iPhone 14 Plus landscape"
  "iPhone 14 Pro"
  "iPhone 14 Pro landscape"
  "iPhone 14 Pro Max"
  "iPhone 14 Pro Max landscape"
  "Kindle Fire HDX"
  "Kindle Fire HDX landscape"
  "LG Optimus L70"
  "LG Optimus L70 landscape"
  "Microsoft Lumia 550"
  "Microsoft Lumia 550 landscape"
  "Microsoft Lumia 950"
  "Microsoft Lumia 950 landscape"
  "Nexus 10"
  "Nexus 10 landscape"
  "Nexus 4"
  "Nexus 4 landscape"
  "Nexus 5"
  "Nexus 5 landscape"
  "Nexus 5X"
  "Nexus 5X landscape"
  "Nexus 6"
  "Nexus 6 landscape"
  "Nexus 6P"
  "Nexus 6P landscape"
  "Nexus 7"
  "Nexus 7 landscape"
  "Nokia Lumia 520"
  "Nokia Lumia 520 landscape"
  "Nokia N9"
  "Nokia N9 landscape"
  "Pixel 2"
  "Pixel 2 landscape"
  "Pixel 2 XL"
  "Pixel 2 XL landscape"
  "Pixel 3"
  "Pixel 3 landscape"
  "Pixel 4"
  "Pixel 4 landscape"
  "Pixel 4a (5G)"
  "Pixel 4a (5G) landscape"
  "Pixel 5"
  "Pixel 5 landscape"
  "Moto G4"
  "Moto G4 landscape"
  "Desktop Chrome HiDPI"
  "Desktop Edge HiDPI"
  "Desktop Firefox HiDPI"
  "Desktop Safari"
  "Desktop Chrome"
  "Desktop Edge"
  "Desktop Firefox"

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

https://playwright.dev/docs/api/class-selectors

https://playwright.dev/docs/api/class-locator

# open playwright inspect 
await page.pause()

await page.waitForSelector('test=Sign in', { timeout:4000})

# assertions
https://playwright.dev/docs/test-assertions

await expect(page.locator('text=Sign in')).toHaveCount(1)
await expect(page.locator('text=Sign in')).not.toHaveCount(1)
await expect(page.locator('text=Sign in')).toHaveAttribute('class',/.*css-dpmy2a/)
await expect(page.locator('text=Sign in')).toHaveClass(/.*css-dpmy2a/)
await expect(page).toHaveURL('https://www.google.com')
await expect(page).toHaveTitle('Google')
await expect(page).toHaveScreenshot()
await expect(page).toHaveScreenshot(${url_path})

# define snapshot dir
export default defineConfig({
  snapshotDir: './snapshots',
});

# soft assertion
expect.sort


# slowmotion
# playwright.config.js
{   
    use: {
        video:'on',
        launchOptions:{
            slowMo: 1000
        }
    }
}  
'video':
    'on'                # record video for each test
    'off'               # Do not record video
    'retain-on-failure' # Record for each test, but remove from successful test runs
    'on-first-retry'    # Record only when retrying a test for the first time

test.beforeAll
test.beforeEach
test.afterAll
test.afterEach

test.describe


# annotaions
test.skip()  # marks the test as irrelevant. Playwright Test does not run such a test. Use this annotation when the test is not applicable in some configuration.
test.fixme() # marks the test as failing. Playwright Test will not run this test, as opposed to the fail annotation. Use fixme when running the test is slow or crashes.
test.fail()  # marks the test as failing. Playwright Test will run this test and ensure it does indeed fail. If the test does not fail, Playwright Test will complain.
test.slow()  # marks the test as slow and triples the test timeout.
test.only()  # You can focus some tests. When there are focused tests, only these tests run.

test('skip this test if browserName is firefox' async ({page,browserName})=>{
    test.skip(browserName==='firefox','Still working on this')
})

# tags @fast @slow @smoke
test('test 1 @smoke' async ({page,browserName})=>{
    // ...
})
npx playwright test --grep "@smoke"

# skip test with tag @smoke
npx playwright test --grep-invert "@smoke"

