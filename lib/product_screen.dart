import 'dart:ui';
import 'rating_stars.dart';
import 'package:flutter/material.dart';
import 'product.dart';

class ProductScreen extends StatefulWidget {
  final Product product;
  ProductScreen({this.product});
  @override
  _ProductScreenState createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 380,
                  width:MediaQuery.of(context).size.width ,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(60),bottomRight: Radius.circular(60)),
                    image: DecorationImage(
                      image: AssetImage(widget.product.imageUrl),
                      fit: BoxFit.cover,
                    ),

                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        color: Colors.black,
                        iconSize: 30,
                        icon: Icon(
                          Icons.arrow_back_ios,
                        ),
                        onPressed: (){
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height - 408,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                //color: Colors.grey,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(50),topRight: Radius.circular(50)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.product.name,
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Text(
                              widget.product.price.toString()+' \$',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        RatingStars(widget.product.rating),
                        SizedBox(
                          height: 8,
                        ),
                        Text(widget.product.description,
                          style: TextStyle(
                            fontSize: 19,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(35.0),
                      child: Container(
                        width: 180,
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: FlatButton(
                          onPressed: (){},
                          child: Text(
                            'Buy',
                            style: TextStyle(
                              fontSize: 25,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            ),


          ],
        ),
      ),
    )

    ;
  }
}
