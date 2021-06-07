class Studant {

  String name;
  double value1;
  double value2;

  Studant(this.name, this.value1, this.value2);

  double calculateAverage() {
    var average = (this.value1 + value2) / 2;
    print("Average: $average");
    return average;
  }

  @override
  String toString() {
    return 'Name: $name, Value1: $value1, Value2: $value2, Average: ${calculateAverage()}';
  }
}