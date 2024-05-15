import'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:job_recommendation/createjob.dart';
import 'package:job_recommendation/updatepreferences.dart';

class HomePage extends StatefulWidget {
  final int userID;
  const HomePage({Key? key,required this.userID}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height*0.08), // Adjust the height as needed
    child: AppBar(

   title: Row(children: [
     Padding(
       padding: const EdgeInsets.all(8.0),
       child: Image.asset("assets/unstop.png",height: size.height*0.08,width: size.width*0.24,fit:BoxFit.contain,),
     ),
   ],),
      actions: [
        FaIcon(FontAwesomeIcons.facebookMessenger,color: Colors.black,),
        SizedBox(width: 20,),
        // FaIcon(FontAwesomeIcons.bell),
        // SizedBox(width: 20,),
        GestureDetector(
          onTap: (){
            Navigator.push(context,MaterialPageRoute(builder: (context)=>Preferences(userID: widget.userID,)));
          },
            child: Image.asset("assets/user.png",height: 30,width: 30,fit:BoxFit.contain,)),
        SizedBox(width: 20,),
        FaIcon(FontAwesomeIcons.bagShopping,color: Colors.black),
        SizedBox(width: 20,),
      ],
    ),),
      body:ListView(
          children: [
            Image.asset("assets/first.jpeg",fit: BoxFit.cover,),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>JobApplicationForm()));
              },
              child: Container(
                height: size.height*0.07,
                //decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue,),
                child: Card(
                  color: Colors.white,
                  borderOnForeground: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 7),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FaIcon(FontAwesomeIcons.add,size: 20,),
                          const  SizedBox(width: 3,),
                          Text("💼",style:TextStyle(fontSize: 20,)),
                          const  SizedBox(width: 10,),
                          Text("Create Job Posts",style:TextStyle(fontSize: 15,color:Colors.black,fontWeight: FontWeight.w500),),
                        ]
                    ),

                  ),
                ),
              ),
            ),
          const  SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Explore Opportunities",style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black)),

                      GestureDetector(
                        child: Container(
                          //decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue,),
                          child: Card(
                            color: Colors.blue,
                            borderOnForeground: true,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 7),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Explore",style:TextStyle(fontSize: 15,color:Colors.white,fontWeight: FontWeight.w500),),
                                  ]
                              ),

                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              Container(
                height: size.height*0.2,
                width: size.width*0.5,
                decoration: BoxDecoration(border: Border.all(color:Colors.grey,),borderRadius: BorderRadius.circular(10),color:Colors.white,),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Explore",style:TextStyle(fontSize: 12,color: Color(0xff00008B),fontWeight: FontWeight.w500),),
                      ]
                  ),
                ),
              )
                ],
              ),
            ),
          const  SizedBox(height: 10,),
            Image.asset("assets/sec.jpeg",fit: BoxFit.cover,),
            Image.asset("assets/third.jpeg",fit: BoxFit.cover,),
            Image.asset("assets/fourth.jpeg",fit: BoxFit.cover,)
          ]),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed, // Ensure all items are visible
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.home,color: Colors.black,size: 20),
            label: 'Unstop',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.book,color: Colors.black,size: 20),
            label: 'Learn',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.laptopCode,color: Colors.black,size: 20),
            label: 'Practise',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.chalkboardTeacher,color: Colors.black,size: 20),
            label: 'Mentorship',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.trophy,color: Colors.black,size: 20),
            label: 'Compete',
          ),
          BottomNavigationBarItem(
            icon:FaIcon(FontAwesomeIcons.toolbox,color: Colors.black,size: 20),
            label: 'Jobs',
          ),
        ],
      ),
    );
  }
}
