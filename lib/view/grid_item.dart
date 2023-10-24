import 'package:emergency_calls/model/emergency_services_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key, required this.emrgencyServices});

  final EmrgencyServices emrgencyServices;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () async {
          String number = emrgencyServices.servicenumber; //set the number here
          await FlutterPhoneDirectCaller.callNumber(number);
        },
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Card(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  emrgencyServices.emrgencyIcon,
                  Text(emrgencyServices.title,
                      style: Theme.of(context).textTheme.titleSmall,
                      softWrap: true,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center)
                ],
              ),
            ),
          ),
        ));
  }
}
