import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:walle/components/components.dart';
import 'package:walle/constants/colors.dart';
import 'package:walle/services/services.dart';

import '../../services/services_constants.dart';
import '../views.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController message = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("WALLE"),
        centerTitle: true,
        actions: [
          IconButton(
            splashRadius: 20,
            onPressed: () {
              Services.signOutUser().then(
                (value) => Get.offAll(
                  () => const SignInView(),
                ),
              );
            },
            icon: const Icon(Icons.logout_sharp),
          )
        ],
      ),
      body: Column(
        children: [
          // List Messages
          Expanded(
              child: FirebaseAnimatedList(
            query: firebaseDatabase.orderByChild('Timestamp'),
            itemBuilder: (context, snapshot, animation, index) {
              final email = snapshot.child('UserEmail').value;
              final mesg = snapshot.child('Message').value;
              return ListTile(
                leading: const CircleAvatar(
                    backgroundColor: customAppTheme,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                    )),
                title: Text(mesg.toString()),
                subtitle: Text(email.toString()),
              );
            },
          )),
          // Post Messages
          Padding(
            padding: const EdgeInsets.only(left: 10.0, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Form(
                    key: formKey,
                    child: CustomTextField(
                      fieldText: "fieldText",
                      textEditingController: message,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter message';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      Services.postMessages(message.text.toString())
                          .then((value) => message.clear());
                    }
                  },
                  icon: const Icon(Icons.arrow_circle_up),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
