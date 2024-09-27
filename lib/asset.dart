import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management/data/db/DB.dart';
import 'package:provider/provider.dart';

class Asset extends StatefulWidget {
  const Asset({super.key, required this.id});

  final int id;

  @override
  State<Asset> createState() => _AssetState();
}

class _AssetState extends State<Asset> {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<DB>(context);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Asset Details'),
      ),
      body: FutureBuilder<AssetData>(
        future: db.getAsset(widget.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return const Center(child: Text('No data available'));
          } else {
            final asset = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Display image if available, or a placeholder icon if not
                  asset.image != null
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(15.0),
                          child: Image.file(
                            File(asset.image!),
                            height: 200,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        )
                      : const Icon(
                          Icons.image_not_supported,
                          size: 200,
                          color: Colors.grey,
                        ),
                  const SizedBox(height: 20),

                  // Display asset name
                  Text(
                    asset.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Display date of purchase
                  Text(
                    'Date of Purchase: ${DateFormat('MM/dd/yyyy').format(asset.dateOfPurchase)}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),

                  // Display total price
                  Text(
                    'Price: \$${asset.total}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),

                  // Display lifespan
                  Text(
                    'Lifespan: ${asset.lifespan} years',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),

                  // Display scrap value
                  Text(
                    'Scrap Value: \$${asset.scrapvalue}',
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),

                  // Display condition
                  Text(
                    'Condition: ${asset.condition}',
                    style: const TextStyle(fontSize: 18),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
