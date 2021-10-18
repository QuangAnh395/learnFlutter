import 'package:flutter_training_kca/Screens/DeMoList/ObjectList.dart';

class SelectLogic{
List<int> _listIndex = [];
List<SelectObject> _listObject = [
  SelectObject(title: "image 1", imageUrl: "https://img.theculturetrip.com/1440x807/smart/wp-content/uploads/2016/08/premier_league_rebrands_designstudio_01.jpg"),
  SelectObject(title: "image 2", imageUrl: "https://iscreativestudio.com/wp-content/uploads/2016/08/logotipos4.jpg"),
  SelectObject(title: "Image 3", imageUrl: "https://i.pinimg.com/originals/6b/a3/18/6ba318474e4cab7cef32a965fd6b982c.png"),
  SelectObject(title: "Image 4", imageUrl: "https://upload.wikimedia.org/wikipedia/en/thumb/b/ba/Ligue_1_Uber_Eats.svg/1200px-Ligue_1_Uber_Eats.svg.png"),
  SelectObject(title: "image 5", imageUrl: "https://static.wikia.nocookie.net/logopedia/images/0/02/Serie_A_logo_%282018%29.png/revision/latest?cb=20180729083244"),
];
//
void  add(int index){
  if(_listIndex.isNotEmpty){
    _listObject[_listIndex[0]].swapSelect();
    _listIndex.removeAt(0);
  }
  _listIndex.add(index);
  _listObject[index].swapSelect();
}
List<SelectObject> getListObject(){
  return _listObject;
}
}