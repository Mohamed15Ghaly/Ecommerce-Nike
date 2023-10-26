import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                      top: 25,
                      right: 0,
                      left: 0,
                      child: Image.asset("assets/Vector.png")),
                  Column(
                    children: [
                      Image.asset("assets/JUST DO IT..png"),
                    ],
                  ),
                  Positioned(
                    bottom: 175,
                    right: 0,
                    left: 0,
                    child: Container(
                      width: double.infinity,
                      child: defaultText(
                          Text_: "Unleash Your Potential, Elevate Your Game.",
                          Size_: 30),
                    ),
                  ),
                  Positioned(
                      bottom: 50,
                      right: 0,
                      left: 0,
                      child: Builder(
                        builder: (context) => defaultMaterialButton(
                            TextMaterialButtom: "Start Now",
                            onPressedFunction: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (_) => Home()));
                            }),
                      )),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _Controller;

  @override
  void initState() {
    _Controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.menu_sharp, size: 30),
                        Image.asset(
                          "assets/Vector.png",
                          width: 75,
                        ),
                        Icon(
                          Icons.shopping_bag_outlined,
                          size: 30,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    defaultText(Text_: "New Collection", Size_: 30),
                    Text(
                      "Explore the new collection of sneakers",
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Color.fromARGB(255, 0, 119, 255),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(25),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                defaultText(
                                    Text_: "20% Discount",
                                    Size_: 25,
                                    Color_: Colors.white,
                                    UseColor: true),
                                Text(
                                  "on your first purchase",
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    TabBar(
                      isScrollable: true,
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey[300],
                      indicatorColor: Colors.white,
                      controller: _Controller,
                      tabs: [
                        defaultText(Text_: "Lifestyle", Size_: 22),
                        defaultText(Text_: "Runing", Size_: 22),
                        defaultText(Text_: "Tennis", Size_: 22),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  color: Colors.grey[100],
                                  borderRadius: BorderRadius.circular(10)),
                              child: TextField(
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.search,
                                      color: Colors.grey,
                                    ),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(255, 0, 119, 255),
                              child: Icon(Icons.filter_list,color: Colors.white,size: 30,))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
          body: Container(
            padding: EdgeInsets.all(20),
            child: TabBarView(
              controller: _Controller,
              children: [
                defaultGridView(),
                defaultGridView(),
                defaultGridView(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class Item extends StatelessWidget {
  final ItemName, ItemImage, ItemPrice;

  const Item(
      {super.key,
        required this.ItemName,
        required this.ItemImage,
        required this.ItemPrice});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black, width: 2)),
                          child: Icon(
                            Icons.arrow_back,
                            shadows: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ],
                          )),
                      defaultText(Text_: ItemName, Size_: 30),
                      Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              border: Border.all(color: Colors.black, width: 2)),
                          child: Icon(
                            Icons.shopping_cart_outlined,
                            shadows: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 1,
                                  spreadRadius: 1)
                            ],
                          )),
                    ],
                  ),
                  Stack(
                    children: [
                      RotationTransition(
                          turns: AlwaysStoppedAnimation(-90 / 360),
                          child: defaultText(
                              Text_: ItemName,
                              Size_: 100,
                              Color_: Colors.grey[200],
                              UseColor: true)),
                      InteractiveViewer(
                          child: Container(
                              height: 500,
                              width: 500,
                              child: Image.asset(ItemImage))),
                      Positioned(
                          bottom: 00,
                          left: 0,
                          right: 0,
                          child: Text(
                            "These white leather Air Max 97 sneakers are a staple piece and feature a round toe, a signature Nike swoosh, a flat sole, a pull tab at the rear, a lace fastening and a logo patch at the tongue.",
                            style: TextStyle(
                              color: Colors.grey[300],
                              // fontWeight: FontWeight.bold
                            ),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text("Size :",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      height: 50,
                      child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) => Container(
                            height: 25,
                            width: 50,
                            decoration: BoxDecoration(
                                color: index == 2 ? Colors.blue : Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                border: Border.all(
                                    color: index == 2
                                        ? Colors.white
                                        : Colors.grey)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "${index + 40}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: index == 2
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ],
                            ),
                          ),
                          separatorBuilder: (context, index) => SizedBox(
                            width: 5,
                          ),
                          itemCount: 10)),
                  SizedBox(
                    height: 25,
                  ),
                  defaultText(Text_: ItemPrice, Size_: 45),
                  defaultText(Text_: "10% OFF", Color_: Colors.red, UseColor: true),
                  Center(
                    child: Container(child: Image.asset("assets/box.png")),
                  ),
                  defaultMaterialButton(
                      TextMaterialButtom: "Add to bag", onPressedFunction: () {})
                ],
              ),
            ),
          ),
        ));
  }
}

Widget defaultMaterialButton(
    {@required String? TextMaterialButtom,
      @required Function()? onPressedFunction}) =>
    Container(
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.black),
      child: MaterialButton(
        onPressed: onPressedFunction,
        child: Text(
          TextMaterialButtom!,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
    );

Widget defaultText({
  @required String? Text_,
  Color? Color_ = Colors.black,
  bool UseColor = false,
  double Size_ = 15,
}) =>
    Text(
      Text_!,
      style: TextStyle(
          fontFamily: "Clash Display",
          fontSize: Size_,
          color: UseColor ? Color_ : null),
    );

Widget defaultGridView() => GridView.builder(
  itemCount: 8,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      mainAxisExtent: 250,
      crossAxisCount: 2,
      crossAxisSpacing: 10,
      mainAxisSpacing: 10),
  itemBuilder: (context, index) => InkWell(
    onTap: () {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => Item(
              ItemName: "Air Max 97",
              ItemImage: "assets/1.png",
              ItemPrice: "\$25")));
    },
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.grey.shade300)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                (index == 1 || index == 2 || index == 6 || index == 7)
                    ? Icons.star
                    : Icons.star_border,
                color:
                (index == 1 || index == 2 || index == 6 || index == 7)
                    ? Colors.black
                    : Colors.grey.shade400,
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                "4,8",
                style: TextStyle(
                    color: Color.fromARGB(255, 255, 183, 0),
                    fontWeight: FontWeight.bold),
              ),
              Spacer(),
              Icon(
                Icons.bookmark_add_outlined,
                color:
                (index == 0 || index == 2 || index == 5 || index == 6)
                    ? Color.fromARGB(255, 0, 119, 255)
                    : Colors.grey.shade400,
              ),
            ],
          ),
          SizedBox(
            height: 25,
          ),
          Image.asset(
            "assets/1.png",
            width: 150,
            height: 125,
          ),
          defaultText(
              Text_: 'Air Max 97',
              Color_: Colors.grey[400],
              UseColor: true),
          SizedBox(
            height: 5,
          ),
          defaultText(Text_: '\$25')
        ],
      ),
    ),
  ),
);
