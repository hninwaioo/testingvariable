import 'package:flutter/material.dart';

main() {
  DuplicateIntegerList();
}

void DuplicateIntegerList() {

  Set<int> duplicateInteger = {1,1,1,2,2,2,3,3,3,4,4,4,5,5,6,7,8,8,9,9};
  print(duplicateInteger);

  Set<int> firstNumber = {1,2,3,4,5};
  print(duplicateInteger.intersection(firstNumber));
}
