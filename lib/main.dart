import 'package:flutter/material.dart';
import 'package:notespad/home.dart';
import 'package:notespad/provider.dart';
import 'package:provider/provider.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:hive/hive.dart';
void main ()async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await path_provider.getApplicationDocumentsDirectory();
   Hive.init(dir.path);

   await Hive.openBox('note');

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ListProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          home: SafeArea(
              child: Home()
          )
      ),
    ) ;
  }
}
