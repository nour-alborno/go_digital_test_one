
import 'package:flutter/material.dart';
import 'package:go_digital_test_one/GridExample/data.dart';
import 'package:go_digital_test_one/GridExample/product_model.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({Key? key}) : super(key: key);

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {

 List<Category>? cat = data.map((e) => Category(e)).toList();


 int indexOfCat = 0;

 @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("from screen: ${cat?[0] ?? "Error"}");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الرئيسية"),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),

      body: Column(
        children: [
          Image.network("https://www.southernliving.com/thmb/UuflED14dkNrrm-TFbkz42Z5mRg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/sl_supremepizza_00072-2000-4cab71bd67774233b45f05e4e32fdfde.jpg", width: double.infinity, height: 300,),
          SizedBox(
            height: 60,
            child: ListView.builder(
              itemCount: cat?.length ?? 0,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
              return Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(10),
                color: Colors.grey,
                child: InkWell(
                    onTap: () {
                           indexOfCat = index;
                      setState(() {});
                    },
                    child: Text( cat?[index].name ?? "", style: TextStyle(color: Colors.white),)));
            },),
          ),

          Expanded(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
                itemCount:  cat?[indexOfCat].products?.length ?? 0,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,

                ),
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    children: [
                      Image.network("https://www.southernliving.com/thmb/UuflED14dkNrrm-TFbkz42Z5mRg=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/sl_supremepizza_00072-2000-4cab71bd67774233b45f05e4e32fdfde.jpg", width: double.infinity, height: 50,),

                      Text(cat?[indexOfCat].products?[index].name ?? ""),
                      Text(" 0"),

                    ],
                  ) ,
                );
              },

            ),
          )
        ],
      ),

    );
  }
}
