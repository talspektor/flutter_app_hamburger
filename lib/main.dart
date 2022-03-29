import 'package:flutter/material.dart';
import 'package:flutter_app_hamburger/categories.dart';
import 'package:flutter_app_hamburger/hamburger_list.dart';
import 'package:flutter_app_hamburger/header.dart';
import 'package:flutter_app_hamburger/rugger_pagee.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.teal,
        cardColor: Colors.white,
        appBarTheme: const AppBarTheme(color: Colors.teal, centerTitle: true),
        bottomAppBarColor: Colors.teal,
        floatingActionButtonTheme:
            const FloatingActionButtonThemeData(backgroundColor: Colors.teal),
      ),
      home: const Hamburger(),
      routes: {BurgerPage.tag: (_) => const BurgerPage()},
      debugShowCheckedModeBanner: false,
    );
  }
}

class Hamburger extends StatefulWidget {
  const Hamburger({Key? key}) : super(key: key);

  @override
  State<Hamburger> createState() => _HamburgerState();
}

class _HamburgerState extends State<Hamburger> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: const Text("Deliver Me"),
            pinned: true,
            leading: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
            actions: [
              IconButton(
                  onPressed: () {}, icon: const Icon(Icons.add_shopping_cart))
            ],
          ),
          const Header(),
          const Categories(),
          const HamburgersList(
            row: 1,
          ),
          const HamburgersList(
            row: 2,
          ),
          // SliverList(
          //   delegate: SliverChildListDelegate(
          //     [
          //       // const Text(
          //       //   'Hamburger',
          //       //   style: TextStyle(fontSize: 300),
          //       // ),
          //     ],
          //   ),
          // ),
        ],
      ),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.home),
      ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(35),
        ),
        child: Container(
          color: Colors.black38,
          child: BottomAppBar(
            shape: const CircularNotchedRectangle(),
            child: Row(
              children: [
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.add_alert),
                  color: Colors.white,
                ),
                const Spacer(),
                const Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.turned_in),
                  color: Colors.white,
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
