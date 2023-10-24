import 'package:emergency_calls/model/emergency_services_model.dart';

int num = 0;

String formatid() {
  num++;
  return ('RQ $num');
}

class Request {
  late String id;
  final String name;
  final EmrgencyServices emrgencyServices;
  final String address;
  final String phone;

  Request({
    required this.phone,
    required this.name,
    required this.emrgencyServices,
    required this.address,
  }) : id = formatid();
}
