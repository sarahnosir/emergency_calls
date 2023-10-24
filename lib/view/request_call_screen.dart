import 'package:emergency_calls/model/request_model.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../view model/app_view_model.dart';

class RequestCallScreen extends StatefulWidget {
  const RequestCallScreen({super.key});

  @override
  State<RequestCallScreen> createState() => _RequestCallScreenState();
}

class _RequestCallScreenState extends State<RequestCallScreen> {
  final TextEditingController namecontroller = TextEditingController();
  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    namecontroller.dispose();
    addresscontroller.dispose();
    phonecontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.pop();
          },
        ),
        title: Text(
          'Request Call',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<AppViewModel>(
          builder: (context, viewmodel, child) => Padding(
            padding: const EdgeInsets.fromLTRB(8, 20, 8, 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextField(
                  controller: namecontroller,
                  decoration: const InputDecoration(label: Text('Name')),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: addresscontroller,
                  minLines: 1,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    label: Text('Address'),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                    controller: phonecontroller,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    keyboardType: TextInputType.phone,
                    maxLength: 11,
                    validator: (number) => validateMobile(number),
                    decoration:
                        const InputDecoration(label: Text('Phone Number'))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Selected Service ",
                        style: Theme.of(context).textTheme.bodyMedium),
                    DropdownButton(
                        value: viewmodel.selected,
                        onChanged: (selectedService) {
                          viewmodel.selected = selectedService!;
                        },
                        items: viewmodel.emergencyServicesAvavlible
                            .map((e) => DropdownMenuItem(
                                value: e,
                                child: Row(
                                  children: [
                                    e.emrgencyIcon,
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(e.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                  ],
                                )))
                            .toList()),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                        onPressed: () {
                          phonecontroller.text = '';
                          addresscontroller.text = '';
                          namecontroller.text = '';
                        },
                        icon: const Icon(Icons.close),
                        label: const Text('Clear')),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton.icon(
                        onPressed: () {
                          final bool numberinValid =
                              validateMobile(phonecontroller.text) != null;
                          if (numberinValid ||
                              namecontroller.text.isEmpty ||
                              addresscontroller.text.isEmpty) {
                            showDialog(
                                context: context,
                                builder: (newcontext) => AlertDialog(
                                      title: const Text("invalid data"),
                                      //   content: Text("fix data"),
                                      icon: const Icon(Icons.warning_rounded),
                                      actions: [
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('ok'))
                                      ],
                                    ));
                          } else {
                            showDialog(
                                context: context,
                                builder: (newcontext) => AlertDialog(
                                      title: const Text(
                                          "you will recive your call in a moment "),
                                      //   content: Text("fix data"),
                                      icon: const Icon(Icons.phone_android),
                                      actions: [
                                        TextButton(
                                            onPressed: () =>
                                                Navigator.pop(context),
                                            child: const Text('ok')),
                                        TextButton(
                                            onPressed: () =>
                                                context.go('/requests'),
                                            child: const Text('Requests Page'))
                                      ],
                                    ));
                            viewmodel.addrequest(Request(
                                name: namecontroller.text,
                                emrgencyServices: viewmodel.selected,
                                address: addresscontroller.text,
                                phone: phonecontroller.text));
                          }
                        },
                        icon: const Icon(Icons.add),
                        label: const Text('Save Request'))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String? validateMobile(String? number) {
  String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
  RegExp regExp = RegExp(pattern);
  if (number!.isEmpty) {
    return 'Please enter mobile number';
  } else if (!regExp.hasMatch(number)) {
    return 'Please enter valid mobile number';
  }
  return null;
}
