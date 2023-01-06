import 'package:auto_size_text/auto_size_text.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/add_cart_provider.dart';
import 'package:flutter_application_2/cart_screen.dart';
import 'package:flutter_application_2/theme/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List _electronics = [];

  void electic(int index) {
    List productList = Provider.of<ProductsVM>(context, listen: false).product;
    List elect = [];
    for (int i = 0; i <= productList.length; i++) {
      if (productList[index]['category'] == 'electronics') {
        elect.addAll(productList[index]);
      }
      setState(() {
        _electronics = elect;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final data = Provider.of<ProductsVM>(context);
    print(_electronics);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const AutoSizeText('H&M'),
        leading: Center(
            child: AutoSizeText(data.city.toString(),
                overflow: TextOverflow.fade,
                style: AppTheme.textStyle12blackbold)),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications,
                color: AppTheme.black,
                size: 30,
              )),
          Stack(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CartScreen(),
                        ));
                  },
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: AppTheme.black,
                    size: 30,
                  )),
              Positioned(
                top: 5,
                right: 5,
                child: Container(
                  height: 18,
                  width: 18,
                  decoration: BoxDecoration(
                      color: AppTheme.red,
                      borderRadius: BorderRadius.circular(20)),
                  child: Center(
                    child: AutoSizeText(
                        data.itemList.length < 10
                            ? '${data.itemList.length}'
                            : '+9',
                        style: AppTheme.textStyle12whitebold),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: Container(
        height: height,
        width: width,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: ListView(
          children: [
            const AutoSizeText(
              'Collections',
              style: AppTheme.textStyle18blackW6,
            ),
            SizedBox(
              height: 100,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: data.mainmenu.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 55,
                        width: 55,
                        margin: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: NetworkImage(
                                data.mainmenu[index]['image'],
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      AutoSizeText(
                        data.mainmenu[index]['title'],
                        style: AppTheme.textStyle14greybold,
                        overflow: TextOverflow.clip,
                      )
                    ],
                  );
                },
              ),
            ),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayAnimationDuration: const Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                height: 140,
                viewportFraction: 0.92,
                initialPage: 0,
                enableInfiniteScroll: true,
                disableCenter: true,
              ),
              items: List.generate(data.sliderimages.length, (index) {
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        data.sliderimages[index]['image'],
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                );
              }),
            ),
            const SizedBox(height: 10),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  mainAxisExtent: 280,
                  childAspectRatio: 1 / 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemCount: data.product.length,
              itemBuilder: (context, index) {
                return Container(
                  width: width,
                  decoration: BoxDecoration(
                    color: AppTheme.bluewhite,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 200,
                            width: width,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(5),
                                  topRight: Radius.circular(5)),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      // '${data.dataList[index]['url']}'
                                      '${data.product[index]['image']}'),
                                  fit: BoxFit.cover),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  data.isFav[index] = !data.isFav[index];
                                });
                                if (data.isFav[index] == true) {
                                  data.add(
                                    image: data.product[index]['image'],
                                    title: data.product[index]['title'],
                                    category: data.product[index]['category'],
                                    price: "${data.product[index]['price']}",
                                  );
                                } else if (data.isFav[index] == false) {
                                  data.delete(index);
                                }
                              },
                              icon: data.isFav[index] == false
                                  ? const Icon(
                                      Icons.favorite_border,
                                      color: AppTheme.grey,
                                    )
                                  : const Icon(
                                      Icons.favorite,
                                      color: AppTheme.red,
                                    ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: AutoSizeText(
                            '${data.product[index]['description']}',
                            overflow: TextOverflow.ellipsis,
                            style: AppTheme.textStyle14greybold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              AutoSizeText('\$ ${data.product[index]['price']}',
                                  style: AppTheme.textStyle16blackbold),
                              const AutoSizeText('50% off',
                                  style: AppTheme.textStyle14greenbold),
                              Container(
                                padding: const EdgeInsets.all(3),
                                decoration: BoxDecoration(
                                    color: AppTheme.grey,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Row(
                                  children: [
                                    const Text('4.7',
                                        overflow: TextOverflow.ellipsis),
                                    const SizedBox(width: 5),
                                    SvgPicture.asset(
                                      'assets/svg/star_fill.svg',
                                      height: 15,
                                      width: 15,
                                    )
                                  ],
                                ),
                              )
                            ]),
                      ),
                      const SizedBox(height: 10)
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 10)
          ],
        ),
      ),
    );
  }
}
