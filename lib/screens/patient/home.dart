import 'package:doctor_appointments/widgets/patient/category_list.dart';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //user avatar & Side Bar
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20, horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CircleAvatar(
                    child: Icon(Icons.person),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.view_headline_sharp),
                  )
                ],
              ),
            ),
            // Welcome text!
            Padding(
              padding:
                  const EdgeInsets.only(left: 15.0, right: 15.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello!",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Dr Waleed Imran",
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                  )
                ],
              ),
            ),
            //Search Bar
            // HomeSearchBar(),
            CategoryListView(),
          ],
        ),
      ),
      backgroundColor: Colors.lightBlueAccent,
    );
  }
}
