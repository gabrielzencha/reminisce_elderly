import 'package:flutter/material.dart';

class UserInformationScreen extends StatefulWidget {
  UserInformationScreen({Key? key}) : super(key: key);

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  final TextEditingController nameController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    
    nameController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    const CircleAvatar(
                      radius: 64,
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ),
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add_a_photo)),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.85,
                    padding:const EdgeInsets.all(20) ,
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your Age',
                      ),

                    )
                    )],
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.85,
                    padding:const EdgeInsets.all(20) ,
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your Age',
                      ),

                    )
                    )],
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.85,
                    padding:const EdgeInsets.all(20) ,
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your Age',
                      ),

                    )
                    )],
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.85,
                    padding:const EdgeInsets.all(20) ,
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your Age',
                      ),

                    )
                    )],
              ),
              Row(
                children: [
                  Container(
                    width: size.width * 0.85,
                    padding:const EdgeInsets.all(20) ,
                    child: TextField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Enter your Age',
                      ),

                    )
                    )],
              ),
            ],
          ),
        )),
      ),
    );
  }
}
