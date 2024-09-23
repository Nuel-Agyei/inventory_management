import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inventory_management/components/add_asset.dart';
import 'package:provider/provider.dart';
import 'package:inventory_management/widgets/summary.dart';
import 'package:inventory_management/data/db/DB.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Summary(
                          name: 'Name',
                          total: 120.5,
                        ),
                        Summary(
                          name: 'Name',
                          total: 80.4,
                        )
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Summary(
                      name: 'Name',
                      total: 12,
                    ),
                    Summary(
                      name: 'Name',
                      total: 12,
                    ),
                  ],
                ),
              ],
            ),
          ),
          FutureBuilder<List<AssetData>>(
            future: Provider.of<DB>(context).getAllAssets(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                    child:
                        CircularProgressIndicator()); // Show a loading indicator
              } else if (snapshot.hasError) {
                return Center(child: Text(snapshot.error.toString()));
              } else if (!snapshot.hasData || snapshot.data.isEmpty) {
                return const Center(child: Text('No data'));
              } else {
                return ListView.builder(
                  itemCount: min(snapshot.data.length, 5),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: ImageIcon(snapshot.data[index].image),
                      title: const Column(),
                    );
                  },
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('damn');
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddAsset()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
