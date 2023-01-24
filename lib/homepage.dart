import 'dart:developer';

import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final formkey = GlobalKey<FormState>();

  final TextEditingController controller = TextEditingController();

  List<String> name = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.all(10),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration:
                    const BoxDecoration(color: Colors.white, boxShadow: [
                  BoxShadow(
                    blurRadius: 2,
                  ),
                ]),
                width: double.infinity,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Form(
                      key: formkey,
                      child: SizedBox(
                        width: 250,
                        height: 140,
                        child: TextFormField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Invalid';
                            } else {
                              return null;
                            }
                          },
                          controller: controller,
                          keyboardType: TextInputType.name,
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Enter value",
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: (() {
                        setState(() {
                          name.add(controller.text);
                          log(name.toString());
                          controller.clear();
                        });
                      }),
                      icon: const Icon(Icons.add),
                    )
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: name.length,
                itemBuilder: ((context, index) {
                  return Container(
                    margin: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(blurRadius: 2),
                      ],
                      color: Colors.white,
                    ),
                    child: ListTile(
                      leading: Text(name[index]),
                      trailing: IconButton(
                          onPressed: (() {
                            setState(() {
                              name.remove(name[index]);
                            });
                          }),
                          icon: const Icon(Icons.delete)),
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
