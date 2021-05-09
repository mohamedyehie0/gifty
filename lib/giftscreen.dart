import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'categories.dart';
import 'product.dart';
import 'data.dart';
import 'product_screen.dart';
class GiftScreen extends StatefulWidget {
  @override
  _GiftScreenState createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  _buildProduct(Product product) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ProductScreen(product: product,)),
        );
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(product.imageUrl),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  product.name,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                product.price.toString()+' \$',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  _buildCategories(Categories category)
  {
    return GestureDetector(
      onTap: (){

      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(

              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(category.imageUrl),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.black87.withOpacity(0.3),
                          Colors.black54.withOpacity(0.3),
                          Colors.black38.withOpacity(0.3),
                        ],
                        stops: [.1,.4,.6,.9],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 3,),
            Expanded(
              child: Text(
                category.name,
                style: TextStyle(
                  fontSize: 11,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromRGBO(228, 180, 180, 1),
        ),
        body: ListView(
          children: [
            Padding(
              padding: EdgeInsets.all(25),
              child: TextField(
                decoration: InputDecoration(
                  fillColor: Colors.grey[100],
                  filled: true,
                  hintText: 'Search..',
                  hintStyle: TextStyle(fontSize: 18,color: Colors.grey[400]),
                  contentPadding: EdgeInsets.all(15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(width: .8),
                  ),
                  enabledBorder:OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide(width: .8,color: Theme.of(context).primaryColor),
                  ) ,
                  prefixIcon: Icon(
                    Icons.search,
                    size: 25,
                    color: Colors.grey[400],
                  ),
                  suffixIcon: IconButton(
                    onPressed: (){},
                    icon: Icon(
                      Icons.clear,
                      size: 25,
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 15),
              child: Text(
                'Your Gifts',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              height: 110,
              color: Colors.grey[100],
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (BuildContext context,int index){
                  Categories category=categories[index];
                  return _buildCategories(category);
                },
              ),
            ),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: GridView.builder(
                padding: EdgeInsets.all(15),
                itemCount: sportProducts.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: .693,
                ),
                itemBuilder: (BuildContext context,int index)
                {
                  Product product=sportProducts[index];
                  return _buildProduct(product);
                },
              ),
            ),
          ],
        ),
      ),
    );

  }
}
