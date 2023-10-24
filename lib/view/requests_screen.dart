import 'package:emergency_calls/view%20model/app_view_model.dart';
import 'package:emergency_calls/view/drawr.dart';
import 'package:emergency_calls/view/requests_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Requests',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      drawer: const MyDrawer(),
      body: Consumer<AppViewModel>(
        builder: (context, viewmodel, child) => SingleChildScrollView(
          child: Column(
            children: [
              ...viewmodel.requests.map(
                (req) => InkWell(
                  onTap: () => Navigator.of(context).push(MaterialPageRoute(
                      builder: ((context) => RequestsDetatilScreen(
                            request: req,
                          )))),
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(req.id),
                          const Text('Pendding'),
                          IconButton(
                            onPressed: () {
                              viewmodel.deleterequest(req);
                            },
                            icon: const Icon(Icons.delete),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
