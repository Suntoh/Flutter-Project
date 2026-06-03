import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project03/widgets/category_widget.dart';
import 'package:project03/widgets/items_widget.dart';
import 'package:project03/widgets/popular_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent.shade100,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.menu, size: 30),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.cyan.withValues(alpha: 0.5),
                            offset: Offset(0, 0.5),
                            blurRadius: 2,
                          ),
                        ],
                      ),
                      child: Badge(
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.all(6),
                        textColor: Colors.white,
                        label: Text("3"),
                        child: InkWell(
                          onTap: () {},
                          child: Icon(
                            CupertinoIcons.cart,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),

                    //Welcome Text
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  children: [
                    Text(
                      "Welcome Back!",
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.cyan,
                        shadows: [
                          Shadow(
                            color: Colors.black45,
                            offset: Offset(0.5, 0.5),
                            blurRadius: 1,
                          ),
                        ],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "What do you want to Buy?",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white24,
                        shadows: [Shadow(blurRadius: 0.5)],
                      ),
                    ),
                  ],
                ),
              ),

              // search bar
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(32),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 0.5),
                      blurRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, size: 30),
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      width: 250,
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Search for Products",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Spacer(),
                    Icon(Icons.filter_list, size: 30),
                  ],
                ),
              ),

              //Prducts Cards
              Container(
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [CategoryWidget(), PopularWidget(), ItemsWidget()],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
