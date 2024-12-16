# patrol_testing_app

An App using patrol tests

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

## Running widgets tests:

`flutter test`
