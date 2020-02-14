import 'package:flutter/material.dart';
class products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<products> {
  var product_list = [
    {
      "name": "Men",
      "picture": "images/Guide-mens-smart-casual-dress-code15@2x.png",

    },
    {
      "name": "Watches",
      "picture": "images/watches-111a.png",

    },
    {
      "name": "Jeans",
      "picture": "images/men-jeans@2x.png",

    },
    {
      "name": "Sneakers",
      "picture": "images/16x9.png",

    },
    {
      "name": "Sun Glasses",
      "picture": "images/pexels-photo-46710.png",

    },
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Single_prod(
            prod_name: product_list[index]['name'],
            prod_pricture: product_list[index]['picture'],

          );
        });
  }
}

class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;


  Single_prod({
    this.prod_name,
    this.prod_pricture,

  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
          tag: prod_name,
          child: Material(
            child: InkWell(
              onTap: () {},
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        prod_name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      /*title: Text(
                        "\$$prod_price",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "\$$prod_old_price",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                            decoration
                                :TextDecoration.lineThrough),
                      ),*/
                    ),
                  ),
                  child: Image.asset(
                    prod_pricture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}