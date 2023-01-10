import 'dart:io';

import 'package:flutter/material.dart';
import 'package:reminisce/common/utils/utils.dart';
import 'package:reminisce/common/widgets/custom_button.dart';
import 'package:reminisce/service/database_service.dart';
class UserInformationScreen extends StatefulWidget {
  UserInformationScreen({Key? key}) : super(key: key);

  @override
  State<UserInformationScreen> createState() => _UserInformationScreenState();
}

class _UserInformationScreenState extends State<UserInformationScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController likesController = TextEditingController();
  final TextEditingController dislikesController = TextEditingController();
  final TextEditingController emergencyContactController =TextEditingController();
  File? image;
  @override
  void dispose() {
    super.dispose();
    phoneController.dispose();
    ageController.dispose();
    likesController.dispose();
    dislikesController.dispose();
    emergencyContactController.dispose();
  }

  void selectImage ()  async {
    image = await pickImageFromGallery(context);
    setState(() {
    });
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
                    image== null ? const CircleAvatar(
                      radius: 64,
                      child: Icon(
                        Icons.person,
                        size: 50,
                      ),
                    ):  CircleAvatar(
                      radius: 64,
                      backgroundImage: FileImage(image!,),
                    ) ,
                    Positioned(
                      bottom: -10,
                      left: 80,
                      child: IconButton(
                          onPressed: selectImage,
                          icon: const Icon(Icons.add_a_photo)),
                    )
                  ],
                ),
              ),
              Row(
                children: [
                  Container(
                      width: size.width * 0.85,
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: ageController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your Age',
                        ),
                      ))
                ],
              ),
              Row(
                children: [
                  Container(
                      width: size.width * 0.85,
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: phoneController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your phone number',
                        ),
                      ))
                ],
              ),
              Row(
                children: [
                  Container(
                      width: size.width * 0.85,
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: likesController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your likes',
                        ),
                      ))
                ],
              ),
              Row(
                children: [
                  Container(
                      width: size.width * 0.85,
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: dislikesController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your dislikes',
                        ),
                      ))
                ],
              ),
              Row(
                children: [
                  Container(
                      width: size.width * 0.85,
                      padding: const EdgeInsets.all(20),
                      child: TextField(
                        controller: emergencyContactController,
                        decoration: const InputDecoration(
                          hintText: 'Enter your emergency contact number',
                        ),
                      ))
                ],
              ),

              CustomButton(
                text: "Save Information", 
                onPressed: () => saveUserInfo(ageController.text, phoneController.text, likesController.text, 
                dislikesController.text, emergencyContactController.text) 
                )
            ],
          ),
        )),
      ),
    );
  }
  void saveUserInfo (String age, String phone, String likes, String dislikes,
                String emergencyContact) async {

            await DatabaseService().savingPersonalData(age, phone);
            
  }
}
