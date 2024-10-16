import 'package:contact_app/main.dart';
import 'package:contact_app/screens/home/model/home_model.dart';
import 'package:contact_app/screens/home/provider/home_provider.dart';
import 'package:contact_app/utils/extension.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ContactModel model =
        ModalRoute.of(context)!.settings.arguments as ContactModel;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
        actions: [
          IconButton(
            onPressed: () {
              nameController.text = model.name!;
              emailController.text = model.email!;
              contactController.text = model.contact!;
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text("Edit Contact"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              hintText: "Name",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          5.h,
                          TextField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              hintText: "email",
                              border: OutlineInputBorder(),
                            ),
                          ),
                          5.h,
                          TextField(
                            controller: contactController,
                            decoration: const InputDecoration(
                              hintText: "contact",
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            ContactModel model = ContactModel(
                              name: nameController.text,
                              email: emailController.text,
                              contact: contactController.text,
                            );
                            context.read<HomeProvider>().updateContact(model);
                            Navigator.pop(context);
                          },
                          child: const Text("Update"),
                        ),
                      ],
                    );
                  });
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Column(
        children: [
          CircleAvatar(
            radius: 80,
            child: Text(
              model.name!.substring(0, 1).toUpperCase(),
            ),
          ),
          ListTile(
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.person),
            ),
            title: const Text("Name"),
            subtitle: Text(model.name!),
          ),
          ListTile(
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.alternate_email_outlined),
            ),
            title: const Text("Email"),
            subtitle: Text(model.email!),
          ),
          ListTile(
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.phone),
            ),
            title: const Text("Contact"),
            subtitle: Text(model.contact!),
          ),
        ],
      ),
    );
  }
}
