import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
      body: Column(
        children: [
          FutureBuilder<List<AssetData>>(
            future: Provider.of(context).db.getAllAssets(), 
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
                      return ListTile(
                        title: Text(asset.name),
                        subtitle: Text(DateFormat('yyyy-MM-dd').format(asset.date)),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            db.deleteAsset(asset.id);
                          },
                ));
                })
                );}
          }),

        ],
      ),
    );
  }
}