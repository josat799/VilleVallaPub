import 'package:flutter/material.dart';

enum Authority {
  none, // Jobbare
  small, //PA eller Styrelsen
  medium, //Personal
  full, //DC eller Webbis
}

enum Status {
  activeWorker, //Jobbare
  elder, //Gamling eller vrak
  elderWorking, //Aktiv-gamling eller aktiv-vrak
}

class User with ChangeNotifier {
  String id = "2609";
  String name = "Josef Atoui";
  String imageUrl =
      "https://res.cloudinary.com/hsocx4wtk/image/upload/c_fit,q_60,w_400/rudwuu2mrpvlotmfjt49";
  Authority auth = Authority.full;
  Status status = Status.activeWorker;
  String address = "Vallavägen 8";
  String phoneNumber = "0707769116";
  List<Map<String, dynamic>> kjamizFakta = [{"Pluggar": "Data", "Untapped": "josef_a", "Snekknamn": ["Kebabbror", "Jossan", ], "Favoritöl": "Kwak"}];

  set authority(Authority authority) {
    auth = authority;
  }

  get authority {
    return auth;
  }

  get userStatus {
    switch (status) {
      case Status.activeWorker:
        return "Aktiv";
      case Status.elder:
        return "Gamling";
      case Status.elderWorking:
        return "Aktiv-Gamling";
      default:
        return "Saknas info";
    }
  }
}
