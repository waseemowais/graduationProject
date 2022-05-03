import 'package:flutter/material.dart';
import 'package:mr_bookshare/Models/facultymodel.dart';
import 'package:mr_bookshare/Route/const.dart';

class MajorScreen extends StatefulWidget {
  const MajorScreen({Key? key}) : super(key: key);

  @override
  _MajorScreenState createState() => _MajorScreenState();
}

class _MajorScreenState extends State<MajorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff069e79),
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pushNamed(homeScreen);

          },
          icon:Icon( Icons.arrow_back_ios,color:Color(0xff069e79) ,),),
        title: Text('Major',style: TextStyle(color: Color(0xff069e79)),),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 120,left: 20,right: 20,bottom: 120),
        child: ListView.builder(
          itemCount: FacultyList.faculty.length,
          itemBuilder: (context, index) {
            var item = FacultyList.faculty[index];
            return
             View(
                  name: item.name!,
                  ontap: () {
                  });
          },
        ),
      ),
    );
  }
}

//==============================================================================
class View extends StatelessWidget {
  const View({Key? key, required this.name, required this.ontap})
      : super(key: key);
  final String name;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(name,style: TextStyle(color:Color(0xff069e79) ),),
        trailing: IconButton(
          onPressed: ontap,
          icon: const Icon(Icons.arrow_forward_ios_rounded,color: Color(0xff069e79),),
        ),
      ),
    );
  }
}
