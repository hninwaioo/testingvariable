
main() {
  MapStringNull();
}
void MapStringNull(){
  Map<String,dynamic> nullMap = {".Net":null,"C++":9999,"C#":9998,"Kotlin":null,"Java":10010,"Flutter":null,"PHP":8000,"Html":null};
  //  map.removeWhere((key, value) => key == null || value == null);
  nullMap.removeWhere((key, value) => value == null);
  print(nullMap);
  final non_nullKeys = (nullMap.keys).toList();
  print(non_nullKeys);

}