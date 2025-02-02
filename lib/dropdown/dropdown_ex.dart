import 'package:flutter/material.dart';

class DropdownExamples extends StatefulWidget {
  const DropdownExamples({super.key});

  @override
  State<DropdownExamples> createState() => _DropdownExamplesState();
}

class _DropdownExamplesState extends State<DropdownExamples> {
  // Basic dropdown
  String? selectedValue;

  // Dropdown with custom items
  String? selectedFruit;

  // Dropdown with form validation
  String? selectedCategory;
  final _formKey = GlobalKey<FormFieldState>();

  // Dropdown with search
  String? selectedCountry;
  List<String> countries = [
    'United States',
    'Canada',
    'United Kingdom',
    'Australia',
    'Germany',
    'France',
    'Japan',
    'Brazil',
  ];
  List<String> filteredCountries = [];

  @override
  void initState() {
    super.initState();
    filteredCountries = countries;
  }

  void filterCountries(String query) {
    setState(() {
      filteredCountries = countries
          .where(
              (country) => country.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  final List<String> items = ['Apple', 'Banana', 'Cherry', 'Date'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Dropdown Examples')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Basic Dropdown
            const Text('Basic Dropdown',
                style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButton<String>(
              selectedItemBuilder: (BuildContext context) {
                return items.map((String item) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      item == selectedValue
                          ? 'Show $item'
                          : item, // Custom display
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  );
                }).toList();
              },
              borderRadius: BorderRadius.circular(20),
              value: items.contains(selectedValue)
                  ? selectedValue
                  : null, // Fix: Ensure the value exists
              hint: const Text('Select an option'),
              underline: const SizedBox.shrink(),
              isDense: true,
              isExpanded: true,
              items: items.map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  selectedValue = newValue;
                });
              },
            ),

            const SizedBox(height: 24),

            // 2. Styled Dropdown with Icons
            const Text('Styled Dropdown with Icons',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DropdownButton<String>(
                value: selectedFruit,
                hint: const Text('Select a fruit'),
                isExpanded: true,
                underline: Container(), // Removes default underline
                items: <Map<String, dynamic>>[
                  {'name': 'Apple', 'icon': Icons.apple},
                  {'name': 'Banana', 'icon': Icons.agriculture},
                  {'name': 'Orange', 'icon': Icons.circle},
                ].map<DropdownMenuItem<String>>((Map<String, dynamic> item) {
                  return DropdownMenuItem<String>(
                    value: item['name'],
                    child: Row(
                      children: [
                        Icon(item['icon'], color: Colors.grey),
                        const SizedBox(width: 8),
                        Text(item['name']),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedFruit = newValue;
                  });
                },
              ),
            ),
            const SizedBox(height: 24),

            // 3. Dropdown with Form Validation
            const Text('Dropdown with Validation',
                style: TextStyle(fontWeight: FontWeight.bold)),
            DropdownButtonFormField<String>(
              key: _formKey,
              value: selectedCategory,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              ),
              hint: const Text('Select a category'),
              items: <String>['Electronics', 'Clothing', 'Books', 'Food']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a category';
                }
                return null;
              },
              onChanged: (String? newValue) {
                setState(() {
                  selectedCategory = newValue;
                });
              },
            ),
            const SizedBox(height: 24),

            // 4. Searchable Dropdown
            const Text('Searchable Dropdown',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Search countries...',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: filterCountries,
            ),
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DropdownButton<String>(
                value: selectedCountry,
                hint: const Text('Select a country'),
                isExpanded: true,
                underline: Container(),
                items: filteredCountries
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCountry = newValue;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
