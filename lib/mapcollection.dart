import 'package:flutter/material.dart';

main() {
  MapStringInt();
}
void MapStringInt(){

  Map<String,int> exMap = {"Hnin":10000,"Wai":9999,"Oo":9998,"Kotlin":10001,"Java":10010,"Flutter":20000,"OOP":15000,"PHP":8000,"Html":11000,"CSS":10000};
  exMap["Wai"] = 9999;
  print(exMap);

  var totalSum = exMap.values;
  for (var numberInt in exMap.values) {
    print('$numberInt was written by ${exMap[numberInt]}');
    if(numberInt >= 10000){
      var result = totalSum.reduce((sum, element) => sum + element);
      print(result);
    }
  }

}