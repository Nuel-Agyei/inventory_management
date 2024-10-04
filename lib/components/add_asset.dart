import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io'; // For File class
import 'package:intl/intl.dart';
import 'package:inventory_management/data/db/DB.dart';
import 'package:drift/drift.dart' as d;
import 'package:provider/provider.dart';

class AddAsset extends StatefulWidget {
  const AddAsset({super.key});

  @override
  AddAssetState createState() => AddAssetState();
}

class AddAssetState extends State<AddAsset> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _lifeSpanController = TextEditingController();
  final TextEditingController _scrapValueController = TextEditingController();
  final TextEditingController _purchasePriceController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String _selectedCondition = 'New';
  final List<String> _conditions = ['New', 'Good', 'Fair', 'Poor'];

  // Variables for image picking
  File? _imageFile;
  final ImagePicker _picker = ImagePicker();
  

  // Method to pick image from gallery or camera
  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  // Method to show DatePicker
  void _pickDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<DB>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add an asset'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Image Picker and Display Widget
              GestureDetector(
                onTap: _pickImage,
                child: Center(
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: _imageFile != null
                        ? Image.file(
                            _imageFile!,
                            fit: BoxFit.cover,
                          )
                        : const Icon(
                            Icons.image,
                            size: 50,
                            color: Colors.grey,
                          ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Name Field
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Date Picker
              TextField(
                controller: TextEditingController(
                    text: DateFormat('MM/dd/yyyy').format(_selectedDate)),
                readOnly: true,
                onTap: () {
                  _pickDate(context);
                },
                decoration: InputDecoration(
                  labelText: DateFormat('MM/dd/yyyy').format(_selectedDate),
                  suffixIcon: const Icon(Icons.calendar_today),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Price at initial purchase
              TextField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Price at initial purchase',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Life span
              TextField(
                controller: _lifeSpanController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Life Span (years)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Scrap Value
              TextField(
                controller: _scrapValueController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Scrap Value',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Condition Dropdown
              DropdownButtonFormField<String>(
                value: _selectedCondition,
                decoration: InputDecoration(
                  labelText: 'Select current condition',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: _conditions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _selectedCondition = newValue!;
                  });
                },
              ),
              const SizedBox(height: 20),

              // Current Price
              TextField(
                controller: _purchasePriceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Current Price',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Save Button
              ElevatedButton(
                onPressed: () {
                  // Logic to save the asset
                  db.addAsset(
                    AssetCompanion(
                      image: d.Value(_imageFile!.path),
                      name: d.Value(_nameController.text),
                      dateOfPurchase: d.Value(_selectedDate),
                      total: d.Value(int.parse(_priceController.text)),
                      lifespan: d.Value(int.parse(_lifeSpanController.text)),
                      scrapvalue: d.Value(int.parse(_scrapValueController.text)),
                      condition: d.Value(_selectedCondition),
                    ),
                  );                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Asset added successfully'),
                    ),
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
