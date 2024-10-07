import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:inventory_management/asset.dart';
import 'package:inventory_management/data/db/DB.dart';
import 'package:provider/provider.dart';

class ListAssets extends StatefulWidget {
  const ListAssets({super.key});

  @override
  State<ListAssets> createState() => _ListAssetsState();
}

class _ListAssetsState extends State<ListAssets> {
  @override
  Widget build(BuildContext context) {
    final db = Provider.of<DB>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of assets'),
      ),
      body: Column(
        children: [
          FutureBuilder<List<AssetData>>(
            future: Provider.of<DB>(context).getAllAssets(), 
            builder: (context, AsyncSnapshot snapshot){
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData) {
                return const Center(child: Text('No data available'));
              } else {
                return Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final asset = snapshot.data![index];
                      return GestureDetector(
                        onTap: ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context)=> Asset(id: asset.id))),
                        child: ListTile(
                          leading: snapshot.data[index].image != null
                                  ? ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.file(File(snapshot.data[index].image)))
                                  :const Icon(Icons.image),
                          title: Text(asset.name),
                          subtitle: Text(DateFormat('yyyy-MM-dd').format(asset.dateOfPurchase)),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              db.deleteAsset(asset.id);
                            },
                                        )),
                      );
                })
                );}
          }),

        ],
      ),
    );
  }
}