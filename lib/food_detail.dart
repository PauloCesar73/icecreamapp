import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'model/list_food.dart';

class DetailFood extends StatelessWidget {
  final ListFood food;
  const DetailFood({Key? key, required this.food}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                color: const Color(0xffFBCEDC),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            CupertinoIcons.chevron_left_square_fill,
                            color: Colors.white,
                            size: 35,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            CupertinoIcons.heart_fill,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ],
                    ),
                    Image.asset(
                      food.image,
                      width: 250,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.nama,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                      ),
                    ),
                    const SizedBox(
                      height: 6,
                    ),
                    Text(
                      food.flav,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 25, bottom: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "R\$${food.price.toString()}",
                            style: const TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: 19,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffFF5F99),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const BuyFood(),
                          ),
                        ],
                      ),
                    ),
                    const Text(
                      "Description",
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 19,
                      ),
                    ),
                    const SizedBox(
                      height: 7,
                    ),
                    Text(
                      food.desc,
                      style: const TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(20),
        child: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xffFF5F99),
            padding: const EdgeInsets.all(25),
            elevation: 0,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            textStyle: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 17,
            ),
          ),
          child: const Text("Buy Now"),
        ),
      ),
    );
  }
}

class BuyFood extends StatefulWidget {
  const BuyFood({Key? key}) : super(key: key);

  @override
  State<BuyFood> createState() => _BuyFoodState();
}

class _BuyFoodState extends State<BuyFood> {
  var buyFood = 1;

  void _incFood() {
    setState(() {
      buyFood++;
    });
  }

  void _decFood() {
    setState(() {
      if (buyFood > 1) {
        buyFood--;
      } else {
        buyFood = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: _decFood,
          icon: const Icon(
            Icons.remove,
            color: Colors.white,
          ),
        ),
        Text(
          "$buyFood",
          style: const TextStyle(color: Colors.white),
        ),
        IconButton(
          onPressed: _incFood,
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}
