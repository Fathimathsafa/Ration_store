import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../core/constants/color.dart';
import '../../../global_widget/widget.dart';
import '../../first_page/view/first_page.dart';

class CardPage extends StatelessWidget {
  String category;
  CardPage({required this.category});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorTheme.maincolor,
        title: Text(category,style: TextStyle(color: ColorTheme.primarycolor),),
        leading: IconButton( onPressed: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>First_Page()));
        }, icon: Icon(Icons.arrow_back_outlined,size: 30,color: ColorTheme.primarycolor,),),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('category').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            final docs = snapshot.data!.docs;
            final categoryDocument = docs.firstWhere((doc) => doc.id == category);
            final contentsCollection = categoryDocument.reference.collection('content');
            return StreamBuilder(
              stream: contentsCollection.snapshots(),
              builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> subSnapshot) {
                if (subSnapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } else if (subSnapshot.hasError) {
                  return Center(child: Text('Error: ${subSnapshot.error}'));
                } else {
                  return Padding(
                    padding: const EdgeInsets.all(10),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, // Adjust the cross axis count as needed
                        childAspectRatio: 1 / 1.5, // Adjust the aspect ratio as needed
                      ),
                      itemCount: subSnapshot.data!.docs.length,
                      itemBuilder: (BuildContext context, int index) {
                        final data = subSnapshot.data!.docs[index].data() as Map<String, dynamic>;
                        return Item_Widget(
                          image: data['image'],
                          name: data['name'],
                          price: data['price'],
                          totalprice: data['total price'],
                          kg: data['quantity'],
                        );
                      },
                    ),
                  );
                }
              },
            );
          }
        },
      ),
      floatingActionButton: Container(width: 200,
          child: FloatingActionButton(onPressed: (){},
              child: Text("OK",style:TextStyle(
                  fontSize: 20,color: Colors.white,fontWeight: FontWeight.bold)),
              shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(1)),
              backgroundColor: ColorTheme.maincolor)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}