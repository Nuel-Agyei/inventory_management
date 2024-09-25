import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management/components/add_asset.dart';
import 'package:provider/provider.dart';
import 'package:inventory_management/widgets/summary.dart';
import 'package:inventory_management/data/db/DB.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {

  @override
  Widget build(BuildContext context) {
    final db = Provider.of<DB>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.replay_outlined),
            onPressed: () {
              setState((){});
            }
            
          ),
        ],
      ),
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
                return Expanded(
                  // This is the fix
                  child: ListView.builder(
                    itemCount: min(snapshot.data.length, 5),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onLongPress: () { 
                          db.deleteAsset(snapshot.data[index].id); 
                          @override
                          setState(){}
                          },
                        child: ListTile(
                          leading: snapshot.data[index].image != null
                              ? ClipRRect(
                                borderRadius: BorderRadius.circular(20.0),
                                child: Image.file(File(snapshot.data[index].image)))
                              :const Icon(Icons.image), // Placeholder if no image is provided
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(snapshot.data[index].name),
                              Text(DateFormat('MM/dd/yyyy')
                                  .format(snapshot.data[index].dateOfPurchase)),
                            ],
                          ),
                          trailing: Text(snapshot.data[index].total.toString()),
                        ),
                      );
                    },
                  ),
                );
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const AddAsset()));
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
