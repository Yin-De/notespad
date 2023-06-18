import 'package:flutter/material.dart';
import 'package:notespad/create.dart';
import 'package:notespad/provider.dart';
import 'package:provider/provider.dart';
// import 'package:hive_flutter/hive_flutter.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState(){
    // TODO: implement initState
    super.initState();
   final store= Provider.of<ListProvider>(context,listen: false);
   store.items(ind: store.note.length );
  }
  Widget build(BuildContext context) {
  // var note=  Hive.box('notes');
  // write(){
  //   note.put(1, 'name');.
  //   print(note.get(1));
  // }
  // write();
    return Consumer<ListProvider>(builder: (context,value,child)=> Scaffold(
        backgroundColor: Colors.black,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white10,
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (c)=>Creates(not: '',)));
              // value.items();
              // print(value.datas);
            },
          child: Icon(
            Icons.add
          ),
        ),
        body: ListView.builder(
          itemCount: value.datas.length,
            itemBuilder: (context,ind){
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 8),
              child: GestureDetector(
                onLongPress: (){

                },
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (c)=>Creates(not: 'edit',title: value.datas[ind]['title'],desc:value.datas[ind]['textera'],inds: ind,)));
             // value.del();
                },
                child: Container(

                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white10,
                    borderRadius: BorderRadius.circular(20),

                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(value.datas[ind]['title'],style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,

                            ),
                            overflow: TextOverflow.ellipsis,),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: SizedBox(
                              width: 200,
                              child: Text(value.datas[ind]['textera'],style: TextStyle(
                                color: Colors.white,

                              ),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,),
                            ),
                          )

                        ],
                      ),
                       GestureDetector(
                           child: Icon(Icons.delete,size: 50,color: Colors.red,),
                         onTap: ()async{
                             await value.note.deleteAt(ind);
                             value.items();
                         },
                       )

                    ],
                  ),
                ),
              ),
            );

        }),
      )

    ); }
}
