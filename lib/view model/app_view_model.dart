import 'package:emergency_calls/model/emergency_services_model.dart';
import 'package:flutter/material.dart';
import 'package:humanitarian_icons/humanitarian_icons.dart';
import '../model/request_model.dart';

class AppViewModel extends ChangeNotifier {
  List<EmrgencyServices> emergencyServicesAvavlible = [
    EmrgencyServices(
        title: 'Ambulance',
        emrgencyIcon: const Icon(HumanitarianIcons.ambulance),
        servicenumber: '123'),
    EmrgencyServices(
        title: 'Fire service',
        emrgencyIcon: const Icon(HumanitarianIcons.fire),
        servicenumber: '180'),
    EmrgencyServices(
        title: 'Police',
        emrgencyIcon: const Icon(HumanitarianIcons.police_station),
        servicenumber: '122'),
    EmrgencyServices(
        title: 'Road accidents',
        emrgencyIcon: const Icon(Icons.car_crash),
        servicenumber: '136'),
    EmrgencyServices(
        title: 'Gas emergency',
        emrgencyIcon: const Icon(HumanitarianIcons.gas_station),
        servicenumber: '129'),
  ];

  late EmrgencyServices selectedItem = emergencyServicesAvavlible[0];

  EmrgencyServices get selected {
    return selectedItem;
  }

  set selected(EmrgencyServices item) {
    selectedItem = item;
    notifyListeners();
  }

  List<Request> requests = [];

  void addrequest(Request newRequest) {
    requests.add(newRequest);
    notifyListeners();
  }

  void deleterequest(Request request) {
    requests.remove(request);
    notifyListeners();
  }

  set selectedEmergencyService(EmrgencyServices selectedService) {
    selectedEmergencyService = selectedService;
    notifyListeners();
  }
}
