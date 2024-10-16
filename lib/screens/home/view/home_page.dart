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
        title: const Text("Home Page"),
      ),
      body: ListView.builder(
        itemCount: context.watch<HomeProvider>().contactList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: CircleAvatar(
              foregroundImage: FileImage(
                File(context.watch<HomeProvider>().contactList[index].image ??
                    "00"),
              ),
            ),
            subtitle: Text(
                "${context.watch<HomeProvider>().contactList[index].contact}"),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios_rounded),
            ),
            onLongPress: () {
              context.read<HomeProvider>().deleteContact(index);
            },
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.detailPage,
                arguments: context.read<HomeProvider>().contactList[index],
              );
            },
            title: Text(
                "${context.watch<HomeProvider>().contactList[index].name}"),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.addContactPage);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
