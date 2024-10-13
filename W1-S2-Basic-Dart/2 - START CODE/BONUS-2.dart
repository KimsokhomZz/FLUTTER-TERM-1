bool isMatchingBrackets(String string) {
  if (string.isEmpty) {
    print("Your input is empty!");
    return false;
  }

  Map<String, String> brackets = {"[": "]", "{": "}", "(": ")"};
  List<String> ifPaired = [];
  for (var item in string.split('')) {
    if (['[', '{', '('].contains(item)) {
      ifPaired.add(item);
    } else if ([']', '}', ')'].contains(item)) {
      if (ifPaired.isEmpty || brackets[ifPaired.last] != item) {
        return false;
      }
      ifPaired.removeLast();
    }
  }
  ;

  return ifPaired.isEmpty;
}

void main() {
  var input = isMatchingBrackets('{what is (42)}?');
  if (input) {
    print('Balanced.');
  } else {
    print('Not balanced!');
  }
}
