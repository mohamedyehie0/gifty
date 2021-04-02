import 'categories.dart';
import 'product.dart';
//sport Category
final _product1=Product(price:150,imageUrl:'images/adidas Black.jpg',name: 'Adidas Black',rating: 4,description: 'Adidas wear has L,XL,XXL sizes and has black,white,grey colors.');
final _product2=Product(price:122,imageUrl:'images/nick.jpg',name: 'Nick Sport',rating: 2,description: 'Sport wear from Nick.');
final _product3=Product(price:126,imageUrl:'images/Nike Little Boys.jpg',name: 'Nike Little Boys',rating: 4,description: 'Nike Little Boys 2-Pc_ Air Color blocked Fleece Top & Jogger Pants Set & Reviews - Sets & Outfits - Kids - Macy\'s.');
final _product4=Product(price:99.9,imageUrl:'images/Coach\'s Wear.jpg',name: 'Coach\'s Wear',rating: 5,description: 'Couch\'s wear has L,XL,XXL sizes and has black,white,grey colors.');

final _product9=Product(price:200,imageUrl:'images/adidas Black.jpg',name: 'Adidas Black',rating: 4,description: 'Adidas wear has L,XL,XXL sizes and has black,white,grey colors.');
final _product10=Product(price:322,imageUrl:'images/nick.jpg',name: 'Nick Sport',rating: 2,description: 'Sport wear from Nick');
final _product11=Product(price:772,imageUrl:'images/Nike Little Boys.jpg',name: 'Nike Little Boys',rating: 4,description: 'Nike Little Boys 2-Pc_ Air Color blocked Fleece Top & Jogger Pants Set & Reviews - Sets & Outfits - Kids - Macy\'s.');
final _product12=Product(price:982,imageUrl:'images/Coach\'s Wear.jpg',name: 'Coach\'s Wear',rating: 5,description: 'Couch\'s wear has L,XL,XXL sizes and has black,white,grey colors.');


final _product5=Product(price:132,imageUrl:'images/Eucerin.jpg',name: 'Eucerin ',rating: 2,description: 'Les nouveaux produits cultes - Elle.');
final _product6=Product(price:232,imageUrl:'images/The java Mama.jpg',name: 'The Java Mama ',rating: 4,description: 'The Java Mama _ Dallas Fort Worth Lifestyle Blog _ Photographer.');
final _product7=Product(price:552,imageUrl:'images/Vaseline Lip Therapy.jpg',name: 'Vaseline Lip ',rating: 5,description: 'Vaseline Lip Therapy Rosy Lips Has Arrived - A Review - Painted Ladies.');
final _product8=Product(price:662,imageUrl:'images/Saint Laurent Rouge.jpg',name: ' Saint Laurent Rouge',rating: 2,description: 'Yves Saint Laurent Rouge Volupté Silky-Sensual Radiant Lipstick SPF 15.');


final _sportCategory=Categories(name: 'Sports',
    imageUrl: 'images/sportCategory.jpg',
    products: [_product1,_product2,_product3,_product4,_product9,_product10,_product11,_product12]
);
final _beautyCategory1=Categories(name: 'Beauty',
    imageUrl: 'images/beautyCategory.jpg',
    products: [_product5,_product6,_product7,_product8]
);
final _sportCategory1=Categories(name: 'Sports',
    imageUrl: 'images/sportCategory.jpg',
    products: [_product1,_product2,_product3,_product4]
);
final _beautyCategory=Categories(name: 'Beauty',
    imageUrl: 'images/beautyCategory.jpg',
    products: [_product5,_product6,_product7,_product8]
);
final _sportCategory2=Categories(name: 'Sports',
    imageUrl: 'images/sportCategory.jpg',
    products: [_product1,_product2,_product3,_product4]
);
final _beautyCategory2=Categories(name: 'Beauty',
    imageUrl: 'images/beautyCategory.jpg',
    products: [_product5,_product6,_product7,_product8]
);
final List<Categories> categories=[
  _beautyCategory,
  _sportCategory,
  _sportCategory1,
  _beautyCategory1,
  _sportCategory2,
  _beautyCategory2,
];
final List<Product> sportProducts=[
  _product1,
  _product2,
  _product3,
  _product4,
  _product9,
  _product10,
  _product11,
  _product12
];
final List<Product> beautyProducts=[
  _product5,
  _product6,
  _product7,
  _product8,
];