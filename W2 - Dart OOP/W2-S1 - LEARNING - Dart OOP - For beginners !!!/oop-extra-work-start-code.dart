// Class Tree
class Tree {
  String type;
  double height;

  Tree(this.type, this.height);

  @override
  String toString() => 'Tree(Type: $type, Height: $height)';
}

class Window {
  String color;
  String position;
  String floor;

  Window(this.color, this.position, this.floor);

  @override
  String toString() =>
      'Window(Color: $color, Position: $position, Floor: $floor)';
}

class Door {
  String color;
  String position;
  String floor;

  Door(this.color, this.position, this.floor);

  @override
  String toString() =>
      'Door(Color: $color, Position: $position, Floor: $floor)';
}

class Roof {
  String color;
  String type;

  Roof(this.color, this.type);
  @override
  String toString() => 'Roof(Color: $color, Type: $type)';
}

// Class House
class House {
  String address;
  List<Tree> trees = []; // by default empty
  List<Window> windows = [];
  Door doors;
  Roof roof;
  bool chimney;

  House(this.address, this.roof, this.doors, this.chimney);

  void addTree(Tree newTree) {
    this.trees.add(newTree);
  }

  void addWindow(Window addWindow) {
    this.windows.add(addWindow);
  }

  void ShowHouse() {
    print("=> Address : $address");
    print("=> ${doors.toString()}");
    print("=> ${roof.toString()}");
    print("=> Chimney : $chimney");
    print("List of window : ");
    for (var window in windows) {
      print(
          "=> Window color is ${window.color}, position is ${window.position}, floor is ${window.floor}");
    }
    print("List of Tree :");
    for (var tree in trees) {
      print("=> Tree type is ${tree.type}, Height is ${tree.height}");
    }
  }
}

void main() {
  Window windowleft = Window("Red", "left", "1st");
  Window windowright = Window("Red", "right", "1st");
  Tree tree = Tree("oak", 180);
  Door door = Door("blue", "center", "1st");
  Roof roof = Roof("black", "classic");
  House house = House("Phonom Penh", roof, door, true);
  house.addWindow(windowright);
  house.addWindow(windowleft);
  house.addTree(tree);
  house.ShowHouse();
}
