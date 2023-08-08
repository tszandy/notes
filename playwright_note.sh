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