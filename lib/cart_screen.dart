import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2/provider/add_cart_provider.dart';
import 'package:flutter_application_2/addaddress.dart';
import 'package:flutter_application_2/theme/theme.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final data = Provider.of<ProductsVM>(context);
    return Scaffold(
      appBar: AppBar(
        title: const AutoSizeText('Cart'),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppTheme.black,
            )),
      ),
      body: SizedBox(
        height: height,
        width: width,
        child: data.itemList.isEmpty
            ? Center(
                child: Column(children: [
                  const SizedBox(height: 100),
                  const AutoSizeText('WISHLIST EMPTY',
                      style: AppTheme.textStyle18blackW6),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: AutoSizeText(
                        'Save your favorite pieces of clothing in one place. Add now,Buy later.',
                        style: AppTheme.textStyle16greybold,
                        textAlign: TextAlign.center),
                  ),
                  Opacity(
                      opacity: 0.5,
                      child: Lottie.asset('assets/empty-cart.json',
                          height: height / 4.5)),
                ]),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: data.itemList.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          direction: DismissDirection.endToStart,
                          key: Key(data.itemList[index].toString()),
                          onDismissed: (direction) {
                            setState(() {
                              data.delete(index);
                              data.isFav[index] = false;
                            });
                          },
                          background: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFE6E6),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Row(
                              children: const [Spacer(), Icon(Icons.delete)],
                            ),
                          ),
                          child: ListTile(
                            leading: SizedBox(
                              width: 100,
                              child: Image.network(
                                '${data.itemList[index]['image']}',
                                fit: BoxFit.fill,
                              ),
                            ),
                            title: AutoSizeText(
                              '${data.itemList[index]['title']}',
                              style: AppTheme.textStyle14greybold,
                            ),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  '${data.itemList[index]['subtitle']}',
                                  style: AppTheme.textStyle14greybold,
                                  textAlign: TextAlign.start,
                                ),
                                AutoSizeText(
                                  '${data.itemList[index]['price']}',
                                  style: AppTheme.textStyle16blackbold,
                                  textAlign: TextAlign.start,
                                ),
                              ],
                            ),
                            trailing: SizedBox(
                              width: 100,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        data.increment(index);
                                      });
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: AppTheme.purple,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: const Icon(
                                        Icons.add,
                                        color: AppTheme.white,
                                        size: 15,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  AutoSizeText(
                                    data.itemList[index]['count'].toString(),
                                    style: AppTheme.textStyle20blackW6,
                                  ),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        if (data.itemList[index]['count'] > 0) {
                                          data.decrement(index);
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: 20,
                                      width: 20,
                                      decoration: BoxDecoration(
                                          color: AppTheme.purple,
                                          borderRadius:
                                              BorderRadius.circular(50)),
                                      child: const Icon(
                                        Icons.remove,
                                        color: AppTheme.white,
                                        size: 15,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Container(
                    width: width,
                    height: 50,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ElevatedButton(
                      style:
                          ElevatedButton.styleFrom(primary: AppTheme.bluewhite),
                      child: const AutoSizeText(
                        "Buy Now",
                        style: AppTheme.textStyle16blackbold,
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AddAdress(),
                            ));
                      },
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
