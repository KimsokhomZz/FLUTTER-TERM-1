//next week must be finish this practice

enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  Address({required this.street, required this.city, required this.zipCode});
}

class Employee {
  final String name;
  final double baseSalary;
  final List<Skill> skills;
  final Address address;
  final int yearsOfExperience;

  Employee(
      {required this.name,
      required this.baseSalary,
      required this.address,
      required this.yearsOfExperience,
      List<Skill>? skills}); //torn hz and need to check

  Employee.mobilemobileDeveloper({
    required String name,
    required double baseSalary,
    required Address address,
    required int yearsOfExperience,
  })  : this.name = name,
        this.baseSalary = baseSalary,
        this.address = address,
        this.yearsOfExperience = yearsOfExperience,
        skills = [Skill.DART, Skill.FLUTTER];

  void printDetails() {
    print(
        'Employee: $name\n Base Salary: \$${baseSalary}\n Address: $address\n Year of Experience: $yearsOfExperience');
    print('Skills: ');
    for (var skill in skills) {
      print('\t$skill');
    }
  }
}

void main() {
  Address emp1Address =
      Address(street: 'Norodom Street', city: 'Phnom Penh', zipCode: '120101');
  var emp1 = Employee(
      name: 'Sokea',
      baseSalary: 40000,
      address: emp1Address,
      yearsOfExperience: 2,
      skills: [Skill.OTHER]);
  emp1.printDetails();

  Address emp2Address =
      Address(street: '6A Street', city: 'Phnom Penh', zipCode: '121001');
  var mobileDevEmp = Employee.mobilemobileDeveloper(
      name: 'Ronan',
      baseSalary: 45000,
      address: emp2Address,
      yearsOfExperience: 7);
  mobileDevEmp.printDetails();
}
