// ignore_for_file: prefer_const_constructors



import 'package:flutter/material.dart';
import 'package:mr_bookshare/Utils/Route/const.dart';
import '../../core/session_manager/user_data_helper.dart';
import 'package:mr_bookshare/component/facultyview.dart';
import 'package:mr_bookshare/core/services/user_service.dart';

class HomeView extends StatefulWidget {
   const HomeView({Key? key,}) : super(key: key);


  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  final UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {

    var userModel = getUserData();

    ImageProvider? imageProvider = (userModel.imageUrl!.isNotEmpty
        ? NetworkImage(userModel.imageUrl!)
        : AssetImage("assets/images/person_avatar.png"))
    as ImageProvider<Object>?;

    return Scaffold(
      backgroundColor: const Color(0xff069e79),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Color(0xff069e79),
            ),
            onPressed: () {
              _userService.logout().then((value) =>
                  Navigator.of(context).popAndPushNamed(loginScreen));
            },
          ),
        ],
        leading: InkWell(
          onTap: ()async {
            var result = await Navigator.of(context).pushNamed(profileScreen, arguments: userModel) as bool;
            if(result != null){
              if(result){
                setState(() {
                });
              }
            }
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width / 4,
              height: MediaQuery.of(context).size.width / 4,
              decoration: BoxDecoration(
                  border: Border.all(color: Color(0xff069e79), width: 3),
                  shape: BoxShape.circle,
                  color: Colors.blueGrey,
                  image:  DecorationImage(
                    fit: BoxFit.cover,
                    image: imageProvider!,
                  )),
            ),
          ),
        ),
      ),
      body: Stack(alignment: Alignment.center, children: [
        CustomPaint(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
          ),
          painter: Header(),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello ${userModel.fullName},',
                style: TextStyle(
                    fontSize: 25,
                    color: Color(0xff069e79),
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Find a Course you want to learn',
                style: TextStyle(
                  fontSize: 20,
                  color: Color(0xff069e79),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 300,
        ),
        Column(
          children: [
            SizedBox(
              height: 200,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, bottom: 2),
              child: Row(
                children: const [
                  Text('Faculties',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                childAspectRatio: 1,
                mainAxisSpacing: 10,
                shrinkWrap: true,
                children: [
                  InkWell(
                    onTap: () {},
                    child: const DashboardCard(
                        color: Colors.white,
                        icon: Icons.medical_services_outlined,
                        text: 'Medicine',
                        textarabic: 'الطب'),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pushNamed(subjectScreen);
                    },
                    child: const DashboardCard(
                        color: Colors.white,
                        icon: Icons.computer_outlined,
                        text: 'IT',
                        textarabic: 'تكنلوجيا المعلومات'),
                  ),
                ],
              ),
            ),
          ],
        )
      ]),
    );
  }
}

class Header extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
