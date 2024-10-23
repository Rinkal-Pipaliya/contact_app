import 'dart:io';
import 'package:contact_app/routes/routes.dart';
import 'package:contact_app/screens/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contacts",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        actions: [
          IconButton(
            onPressed: () async {
              bool isLock = await context.read<HomeProvider>().openLock();
              if (isLock) {
                Navigator.pushNamed(context, AppRoutes.hidePage);
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("Lock not found"),
                    behavior: SnackBarBehavior.fixed,
                  ),
                );
              }
            },
            icon: const Icon(Icons.lock),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: context.watch<HomeProvider>().contactList.length,
          itemBuilder: (context, index) {
            final contact = context.watch<HomeProvider>().contactList[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 4,
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: ListTile(
                contentPadding: const EdgeInsets.all(10),
                leading: CircleAvatar(
                  radius: 30,
                  backgroundImage: contact.image != null
                      ? FileImage(File(contact.image!))
                      : const AssetImage('assets/images/default_avatar.png')
                          as ImageProvider,
                ),
                title: Text(
                  contact.name!,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  contact.contact!,
                  style: TextStyle(
                    color: Colors.grey[600],
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.detailPage,
                      arguments: contact,
                    );
                  },
                  icon: const Icon(Icons.arrow_forward_ios_rounded),
                ),
                onLongPress: () {
                  context.read<HomeProvider>().deleteContact(index);
                },
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addContactPage);
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(
          Icons.add,
          size: 30,
        ),
      ),
      backgroundColor: Colors.grey[200],
    );
  }
}
