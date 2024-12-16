import 'package:flutter/material.dart';

class MyDetailsScreen extends StatefulWidget {
  @override
  _MyDetailsScreenState createState() => _MyDetailsScreenState();
}

class _MyDetailsScreenState extends State<MyDetailsScreen> {
  // Track the expanded state for each section
  List<bool> _isExpanded = [true, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Details')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                // Toggle the state for the tapped section
                _isExpanded[index] = !isExpanded;
              });
            },
            children: [
              // Basic Info Section
              ExpansionPanel(
                canTapOnHeader: true,
                isExpanded: _isExpanded[0],
                headerBuilder: (context, isExpanded) {
                  return const ListTile(
                    key: Key('basicInfoHeader'),
                    title: Text(
                      'Basic Info',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        key: const Key('nameField'),
                        decoration: const InputDecoration(labelText: 'Name'),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        key: const Key('surnameField'),
                        decoration: const InputDecoration(labelText: 'Surname'),
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        key: const Key('dobField'),
                        decoration:
                            const InputDecoration(labelText: 'Date of Birth'),
                        keyboardType: TextInputType.datetime,
                      ),
                    ],
                  ),
                ),
              ),

              // Availability Section
              ExpansionPanel(
                canTapOnHeader: true,
                isExpanded: _isExpanded[1],
                headerBuilder: (context, isExpanded) {
                  return const ListTile(
                    key: Key('availabilityHeader'),
                    title: Text(
                      'Availability',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        key: const Key('startingDateField'),
                        decoration: const InputDecoration(
                          labelText: 'Possible Starting Date',
                        ),
                        keyboardType: TextInputType.datetime,
                      ),
                    ],
                  ),
                ),
              ),

              // Physical Details Section
              ExpansionPanel(
                canTapOnHeader: true,
                isExpanded: _isExpanded[2],
                headerBuilder: (context, isExpanded) {
                  return const ListTile(
                    key: Key('physicalDetailsHeader'),
                    title: Text(
                      'Physical Details',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  );
                },
                body: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      TextFormField(
                        key: const Key('heightField'),
                        decoration:
                            const InputDecoration(labelText: 'Height (cm)'),
                        keyboardType: TextInputType.number,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        key: const Key('weightField'),
                        decoration:
                            const InputDecoration(labelText: 'Weight (kg)'),
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: ElevatedButton(
        key: const Key('saveButton'),
        onPressed: () {
          // Add save logic here
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Details saved successfully!')),
          );
        },
        child: const Text('Save Details'),
      ),
    );
  }
}
