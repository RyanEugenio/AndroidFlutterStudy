import 'dart:math';

class Person {

  String name;
  double weight;
  double height;

  Person(this.name, this.weight, this.height);

  double calculateIMC() {
    // var imc = this.weight / (this.height * this.height);
    var imc = this.weight / pow(this.height, 2);
    print("IMC: ${imc}");
    return imc;
  }

  @override
  String toString() {
    return 'name: $name, weight: $weight, height: $height, IMC: ${this.calculateIMC()}';
  }
}