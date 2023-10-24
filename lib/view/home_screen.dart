import 'package:emergency_calls/view%20model/app_view_model.dart';
import 'package:emergency_calls/view/drawr.dart';
import 'package:emergency_calls/view/grid_item.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Emergency Calls',
              style: Theme.of(context).textTheme.titleMedium),
        ),
        drawer: const MyDrawer(),
        body: Consumer<AppViewModel>(
          builder: (context, viewmodel, child) => GridView(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2),
            children: [
              InkWell(
                  onTap: () {
                    context.push('/makerequest');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Card(
                      child: Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(10, 80, 10, 50),
                                child: Text('Request Call',
                                    style:
                                        Theme.of(context).textTheme.titleSmall,
                                    softWrap: true,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.center),
                              ),
                            ]),
                      ),
                    ),
                  )),
              ...viewmodel.emergencyServicesAvavlible.map((e) => GridItem(
                    emrgencyServices: e,
                  ))
            ],
          ),
        ));
  }
}
