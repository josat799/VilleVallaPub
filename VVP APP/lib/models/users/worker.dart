import 'package:vvp/models/users/user.dart';

enum BenefitType {
  food,
  beverage,
}

class Benefit {
  BenefitType benefit;
  DateTime expiryDate;
  bool activated;

  Benefit(this.benefit, this.expiryDate, this.activated);

  void activateBenefit() {
    activated = true;
  }

}

class Worker extends User {
  List<Map<String, String>> kjamizFacts;
  List<Benefit> benefits;

  Worker(String id, String name) : super(id: id, name: name, );

  void addBenefit(Benefit benefit) {
    benefits.add(benefit);
  }




}