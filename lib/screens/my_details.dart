import 'package:flutter/material.dart';

class MyDetailsScreen extends StatefulWidget {
  @override
  _MyDetailsScreenState createState() => _MyDetailsScreenState();
}

class _MyDetailsScreenState extends State<MyDetailsScreen> {
  bool _isBasicInfoExpanded = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Details')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Collapsible Basic Info Card
              Card(
                elevation: 2,
                child: Column(
                  children: [
                    // Header for Basic Info
                    ListTile(
                      title: const Text(
                        'Basic Info',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(
                          _isBasicInfoExpanded
                              ? Icons.expand_less
                              : Icons.expand_more,
                        ),
                        onPressed: () {
                          setState(() {
                            _isBasicInfoExpanded = !_isBasicInfoExpanded;
                          });
                        },
                      ),
                    ),
                    // Body of Basic Info
                    if (_isBasicInfoExpanded)
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            TextFormField(
                              key: const Key('nameField'),
                              decoration: const InputDecoration(
                                labelText: 'Name',
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              key: const Key('surnameField'),
                              decoration: const InputDecoration(
                                labelText: 'Surname',
                              ),
                            ),
                            const SizedBox(height: 8),
                            TextFormField(
                              key: const Key('dobField'),
                              decoration: const InputDecoration(
                                labelText: 'Date of Birth',
                              ),
                              keyboardType: TextInputType.datetime,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Save Button
              ElevatedButton(
                key: const Key('saveButton'),
                onPressed: () {
                  // Add save logic here
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Details saved!')),
                  );
                },
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
