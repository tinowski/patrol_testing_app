# patrol_testing_app

An App using patrol tests

## Test layers

Unit Tests: Validate individual methods, classes, or components in isolation.

-    Ensures your core logic behaves correctly.
-    Fast to execute and easy to debug.

Widget Tests: Verify the UI components work as intended in isolation.

-    Focuses on the behavior and appearance of individual widgets.
-    Faster than integration tests but slower than unit tests.

Integration Tests: Test the app as a whole, including interactions between various components and external services.

-    Ensures the app works as intended in a real-world scenario.
-    Slower but critical to catch edge cases and system-wide bugs.

## Adding patrol

flutter pub add patrol --dev

`patrol:
    app_name: My App
    android:
    package_name: com.example.myapp
    ios:
        bundle_id: com.example.MyApp`

## Running patrol tests:

`patrol test -t integration_test/example_test.dart`
`patrol develop test -t integration_test/example_test.dart`
`patrol develop test -t integration_test/login_flow_test.dart`
`patrol develop test -t integration_test/drawer_flow_test.dart`

## Running widgets tests:

`flutter test`

## Standard results logging:

![alt text](<Screenshot 2025-01-10 at 11.02.52.png>)

## Test coverage report

`flutter test --coverage`

### Generate an HTML report:

`genhtml coverage/lcov.info -o coverage/html`

### Open the report:

`open coverage/html/index.html`

## Allure reporting
