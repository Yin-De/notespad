import 'package:flutter/material.dart';
import 'package:notespad/provider.dart';
import 'package:provider/provider.dart';

class Creates extends StatefulWidget {
  final not;
  final  title;
  final  desc;
  final  inds;
  const Creates({Key? key, this.not,  this.title,  this.desc,  this.inds, }) : super(key: key);
  @override
  State<Creates> createState() => _CreatesState();
}

class _CreatesState extends State<Creates> {
  TextEditingController titile=TextEditingController();
  TextEditingController textera=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


   widget.not=='edit' ? titile.text=widget.title : titile.text='';
    widget.not=='edit' ? textera.text=widget.desc : textera.text='';

    return Consumer<ListProvider>(builder: (context,value,child)=>Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.grey,
                    ),
                  ),
                  GestureDetector(
                    onTap: ()async{
                      if(widget.not=='edit'){
                        void edit(){
                          value.note.putAt(widget.inds, {'title':titile.text,'textera':textera.text});
                          value.items();
                          Navigator.pop(context);
                        }
                        return edit();

                      }
                      Object note={'title':titile.text,'textera':textera.text};
                      value.note.add(note);
                       value.items();
                      Navigator.pop(context);
                    },
                    child: widget.not=='edit' ? Text('Edit',style: TextStyle(color: Colors.grey,fontSize: 18),): Text('Save',style: TextStyle(color: Colors.grey,fontSize: 18),),
                  )

                ],
              ),
            ),
            TextField(
              controller: titile,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 25
                ),
                decoration: InputDecoration(
                  labelStyle: TextStyle(
                    color: Colors.red
                  ),
                    hintText: "Title",
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintStyle: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,

                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide.none
                  )

                ),

            ),

            TextField(
              controller: textera,
                style: TextStyle(
                    color: Colors.grey
                ),
              keyboardType: TextInputType.multiline,
              maxLines: 20,
              autofocus: true,
              decoration: InputDecoration(
                hintText: "Start typing",
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),

                  hintStyle: TextStyle(

                      color: Colors.grey
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide.none
                  )
              )

            ),

          ],
        ),
      ),
    ));
  }
}
