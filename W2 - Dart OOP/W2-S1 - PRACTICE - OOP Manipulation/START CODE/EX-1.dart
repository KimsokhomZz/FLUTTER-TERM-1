//next week must be finish this practice

enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  Address(this.street, this.city, this.zipCode);
}

class Employee {
  // Q1- Add the following new attributes to the Employee class:
  static const baseSalary = 40000;

  final String _name;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee(this._name, this._skills, this._address, this._yearsOfExperience);

  //Q2 - Update the constructor to initialize the new attributes:
  Employee.mobileDeveloper(String name, Address address, int yearsOfExperience)
      : _skills = [Skill.FLUTTER, Skill.DART],
        _name = name,
        _address = address,
        _yearsOfExperience = yearsOfExperience;
  // Q3 - Make all attributes private and provide getter methods for accessing them:
  String get name => _name;
  List<Skill> get skill => _skills;
  Address get address => _address;
  int get yearOfExperience => _yearsOfExperience;

  // Q4 – Add a method to compute the salary of the employee (you can create your own rules!):
  int computeSalary() {
    int salary = baseSalary + (_yearsOfExperience * 2000);
    for (int i = 0; i < _skills.length; i++) {
      switch (_skills[i]) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
          break;
      }
    }

    return salary;
  }
}

void main() {
  Address emp1Address = Address('Norodom Street', 'Phnom Penh', '120101');
  var emp1 = Employee.mobileDeveloper('Kim', emp1Address, 3);
  print(emp1.name);
  print('Kim Salary as a mobile app developer: ${emp1.computeSalary()}');

  Address emp2Address = Address('6A Street', 'Phnom Penh', '121001');
  var emp2 = Employee('Yushi', [Skill.FLUTTER, Skill.OTHER], emp2Address, 5);
  print(emp2.skill);
  print('Yushi Salary as a simple employee: ${emp2.computeSalary()}');
}
