import 'dart:io';

import 'package:contact_app/routes/routes.dart';
import 'package:contact_app/screens/home/model/home_model.dart';
import 'package:contact_app/screens/home/provider/home_provider.dart';
import 'package:contact_app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  String imagePath = '';
  int currentStep = 0;

  // Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Contact"),
      ),
      body: Stepper(
        currentStep: currentStep,
        onStepContinue: () {
          if (currentStep < 3) {
            setState(() {
              currentStep++;
            });
          }
        },
        onStepCancel: () {
          if (currentStep > 0) {
            setState(() {
              currentStep--;
            });
          }
        },
        steps: [
          // Image
          Step(
            title: const Text("Personal Info"),
            content: Column(
              children: [
                imagePath.isEmpty
                    ? const CircleAvatar(
                        radius: 70,
                      )
                    : CircleAvatar(
                        radius: 70,
                        backgroundImage: FileImage(
                          File(imagePath),
                        ),
                      ),
                10.h,
                ElevatedButton(
                  onPressed: () async {
                    ImagePicker imagePicker = ImagePicker();
                    XFile? file = await imagePicker.pickImage(
                      source: ImageSource.gallery,
                      preferredCameraDevice: CameraDevice.front,
                      imageQuality: 100,
                    );
                    if (file != null) {
                      setState(() {
                        imagePath = file.path;
                      });
                    }
                  },
                  child: const Text("Get Image"),
                ),
              ],
            ),
          ),
          // Name and mobile
          Step(
            title: const Text("Contact Details"),
            content: Column(
              children: [
                TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    labelText: "Full Name",
                    border: OutlineInputBorder(),
                  ),
                ),
                10.h,
                TextFormField(
                  controller: phoneController,
                  maxLength: 10,
                  decoration: const InputDecoration(
                    labelText: "Phone Number",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.phone,
                ),
              ],
            ),
          ),
          // Email
          Step(
            title: const Text("Email and Address"),
            content: Column(
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
          // Save
          Step(
            title: const Text("Save"),
            content: ElevatedButton(
              onPressed: () {
                ContactModel model = ContactModel(
                  name: nameController.text,
                  email: emailController.text,
                  image: imagePath,
                  contact: phoneController.text,
                );

                context.read<HomeProvider>().addContact(model);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Save Successful"),
                    shape: BeveledRectangleBorder(),
                    behavior: SnackBarBehavior.floating,
                  ),
                );
                Navigator.pop(context);
              },
              child: const Text("Save"),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.counterPage);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
