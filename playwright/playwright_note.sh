https://github.com/microsoft/playwright
https://playwright.dev/docs/intro
https://javadoc.io/doc/com.microsoft.playwright/playwright/latest/index.html

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

