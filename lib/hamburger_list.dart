import 'package:flutter/material.dart';
import 'package:flutter_app_hamburger/rugger_pagee.dart';

class HamburgersList extends StatefulWidget {
  final int row;
  const HamburgersList({Key? key, required this.row}) : super(key: key);

  @override
  State<HamburgersList> createState() => _HamburgersListState();
}

class _HamburgersListState extends State<HamburgersList> {
  int items = 10;

  Widget baconImage = SizedBox(
    height: 110,
    child: Image.asset('images/burger.png'),
  );

  Widget chickenImage = SizedBox(
    height: 110,
    child: Image.asset('images/burger2.png'),
  );

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        height: widget.row == 2 ? 330 : 240,
        child: ListView.builder(
            itemCount: items,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              bool reverse = widget.row == 2 ? index.isEven : index.isOdd;
              return Stack(
                children: [
                  Container(
                    height: 240,
                    width: 200,
                    margin: EdgeInsets.only(
                        left: 20, right: items == index ? 20 : 0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(BurgerPage.tag);
                      },
                      child: Card(
                        color: Theme.of(context).primaryColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(45),
                            bottomRight: Radius.circular(15),
                            topLeft: Radius.circular(45),
                            topRight: Radius.circular(45),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: Column(
                            children: [
                              Text(
                                reverse ? 'Burger' : 'Chicken',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              Row(
                                children: [
                                  const Spacer(),
                                  const Text(
                                    '15.95 \$ CAN',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const Spacer(),
                                  SizedBox(
                                    width: 50,
                                    height: 50,
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: const Icon(Icons.add),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        elevation: 3,
                        margin: const EdgeInsets.all(10),
                      ),
                    ),
                  ),
                  Positioned(
                    top: reverse ? 80 : 80,
                    left: reverse ? 5 : 0,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(BurgerPage.tag);
                      },
                      child: reverse ? chickenImage : baconImage,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }
}
