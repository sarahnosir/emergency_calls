import 'package:flutter/material.dart';

import '../model/request_model.dart';

class RequestsDetatilScreen extends StatelessWidget {
  const RequestsDetatilScreen({super.key, required this.request});
  final Request request;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Request Detalis')),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 20, 10, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.emergency,
                      size: 40,
                    ),
                    Text(
                      request.id,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '  Statues : Pendding',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Divider(
                  height: 40.0,
                  thickness: 2.0,
                  color: Theme.of(context).dividerColor,
                  indent: 5.0,
                  endIndent: 35.0,
                ),
                Text(
                  'Name:',
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                Text(
                  request.name,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text('Phone Number :',
                    style: Theme.of(context).textTheme.titleSmall),
                Text(request.phone,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(
                  height: 20,
                ),
                Text('Address :',
                    style: Theme.of(context).textTheme.titleSmall),
                Text(request.address,
                    style: Theme.of(context).textTheme.bodyMedium),
                const SizedBox(
                  height: 20,
                ),
                Text('Service :',
                    style: Theme.of(context).textTheme.titleSmall),
                Row(
                  children: [
                    request.emrgencyServices.emrgencyIcon,
                    Text(request.emrgencyServices.title,
                        style: Theme.of(context).textTheme.bodyMedium)
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
