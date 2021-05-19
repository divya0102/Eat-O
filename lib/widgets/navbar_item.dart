import 'package:eato/screens/screens.dart';
import 'package:eato/screens/search.dart';
class LocalData{
  static List<Map<String, dynamic>> bottomNavList = [
  {
    'screen':Home(),
    'title':'Home' ,
  },
  {
    'screen': search(),
    'title':'Search',
  },
  {
    'screen': FoodOrderPage(),
    'title':'Cart',
  },
    {
      'screen': Account(),
      'title':'Account',
    },


];
}