import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_testing_app/screens/custom_drawer.dart';
import 'package:patrol_testing_app/screens/login.dart';
import 'package:patrol_testing_app/screens/logout.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  patrolTest(
    'CustomDrawer renders correctly and allows navigation',
    ($) async {
      // Launch a MaterialApp with a Scaffold and CustomDrawer
      await $.pumpWidgetAndSettle(
        MaterialApp(
          initialRoute: '/',
          routes: {
            '/': (context) => Scaffold(
                  appBar: AppBar(
                    title: const Text('Test Drawer'),
                  ),
                  drawer: const CustomDrawer(username: 'John Doe'),
                ),
            '/my-details': (context) =>
                const Scaffold(body: Center(child: Text('My Details Page'))),
            '/documents': (context) =>
                const Scaffold(body: Center(child: Text('Documents Page'))),
            '/my-trainings': (context) =>
                const Scaffold(body: Center(child: Text('My Trainings Page'))),
            '/contracts': (context) =>
                const Scaffold(body: Center(child: Text('Contracts Page'))),
            '/settings': (context) =>
                const Scaffold(body: Center(child: Text('Settings Page'))),
          },
        ),
      );

      // Act: Tap the burger icon to open the drawer
      await $.tester.tap(find
          .byTooltip('Open navigation menu')); // Locate burger icon by tooltip
      await $.tester.pumpAndSettle(); // Wait for animations to finish

      // Assert drawer header and username are present
      expect($(#drawerHeader), findsOneWidget);
      expect($(#drawerUsername).text, 'John Doe');

      // Navigate to "My Details"
      await $(#myDetailsTile).tap();
      await $.pumpAndSettle();
      expect($('My Details Page'), findsOneWidget);

      // Tap back
      await $.native.pressBack();
      await $.pumpAndSettle();

      // Navigate to "Documents"
      await $(#documentsTile).tap();
      await $.pumpAndSettle();
      expect($('Documents Page'), findsOneWidget);

      // Tap back
      await $.native.pressBack();
      await $.pumpAndSettle();

      // Navigate to "My Trainings"
      await $(#myTrainingsTile).tap();
      await $.pumpAndSettle();
      expect($('My Trainings Page'), findsOneWidget);

      // Tap back
      await $.native.pressBack();
      await $.pumpAndSettle();

      // Navigate to "Contracts"
      await $(#contractsTile).tap();
      await $.pumpAndSettle();
      expect($('Contracts Page'), findsOneWidget);

      // Tap back
      await $.native.pressBack();
      await $.pumpAndSettle();

      // Navigate to "Settings"
      await $(#settingsTile).tap();
      await $.pumpAndSettle();
      expect($('Settings Page'), findsOneWidget);

      // Tap back
      await $.native.pressBack();
      await $.pumpAndSettle();

      // Logout navigation
      await $(#logoutTile).tap();
      await $.pumpAndSettle();
      expect($(LoginScreen), findsOneWidget);
    },
  );
}
