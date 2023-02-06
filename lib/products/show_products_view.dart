import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../models/Product.dart';

class ShowProductView extends StatelessWidget {
  Widget ProductContainer(name, price, desc) {
    return ListTile(
        title: Text(name), subtitle: Text(price), trailing: Text(desc));
  }

  getProducts() async {
    CollectionReference ref = FirebaseFirestore.instance.collection("products");
    return ref.get();
  }

  const ShowProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: getProducts(),
          builder: (context, AsyncSnapshot snapshot) {
            return ListView.builder(
                itemCount: snapshot.data.docs.length,
                itemBuilder: (context, i) {
                  if (snapshot.hasData) {
                    var myProduct = snapshot.data.docs[i];
                    return ProductContainer(myProduct["name"],
                        myProduct["price"], myProduct["description"]);
                  } else {
                    return CircularProgressIndicator();
                  }
                });
          },
        ),
      ),
    );
  }
}



// ElevatedButton(
//         onPressed: () async {
//           QuerySnapshot data = await getProducts();
//           for (var doc in data.docs) {
//             var prductData = doc.data();
//             print(prductData);
//           }
//         },
//         child: Text("Get Products"),
//       ),
