import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:job_recommendation/api/updatepreferencesapi.dart';
import 'package:job_recommendation/homepage.dart';

class Preferences extends StatefulWidget {
  final int userID;
  const Preferences({Key? key,required this.userID}) : super(key: key);

  @override
  State<Preferences> createState() => _PreferencesState();
}

class _PreferencesState extends State<Preferences> {
  List<String> _selectedOptionsskills = [];
  List<String> _selectedOptionsjobtitles = [];
  List<String> _selectedOptionslocations = [];

  String? _selectedOption;
  List<String> _optionsskills = ['Python', 'JavaScript',
    'HTML',
    'CSS',
    'React',
    'Angular',
    'Node.js',
    'MongoDB',
    'Firebase',
    'Flutter',];
  List<String> _optionsjobtitles = ['Software Engineer',
    'Web Developer',
    'Mobile App Developer',
    'Data Scientist',
    'Data Analyst',
    'UI/UX Designer',
    'Product Manager',
    'Project Manager',
    'Business Analyst',
    'DevOps Engineer',];
  List<String> _optionsjoblocation= ['Mumbai',
    'Delhi',
    'Bangalore',
    'Hyderabad',
    'Chennai',
    'Kolkata',
    'Pune',
    'Ahmedabad',];
  List<String>_optionslevel=['Fresher',"Intermediate","Senior level"];
  @override
  Widget singlepreference(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          DropdownButtonFormField<String>(
            value: _selectedOption,
            onChanged: (String? value) {
              setState(() {
                _selectedOption = value;
              });
            },
            items: _optionslevel.map((String option) {
              return DropdownMenuItem<String>(
                value: option,
                child: Text(option),
              );
            }).toList(),
            hint: Text('Experience Level'),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(height: 20),
          _selectedOption != null
              ? Row(
            children: [
              Text('Selected Option: $_selectedOption',style: TextStyle(fontWeight: FontWeight.bold),),
              SizedBox(width: 8),
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    _selectedOption = null;
                  });
                },
              ),
            ],
          )
              : Container(),
        ],
      ),
    );
  }
  Widget preferencesfield(List<String>optionlist,List<String>answerlist,String text){
    return  Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          DropdownButtonFormField(
            value: null,
            items: optionlist.map((option) {
              return DropdownMenuItem(
                value: option,
                child: Text(option),
              );
            }).toList(),
            onChanged: (value) {
              if (value != null && !answerlist.contains(value)) {
                setState(() {
                  answerlist.add(value);
                });
              }
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: text,
              labelText: text,
            ),
          ),
          SizedBox(height: 20),
          Wrap(
            spacing: 8,
            children: answerlist.map((option) {
              return Chip(
                label: Text(option),
                onDeleted: () {
                  setState(() {
                    answerlist.remove(option);
                  });
                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height*0.08), // Adjust the height as needed
        child: AppBar(
automaticallyImplyLeading: false,
          title: Row(children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/unstop.png",height: size.height*0.08,width: size.width*0.24,fit:BoxFit.contain,),
            ),
          ],),
        ),),
      body: ListView(
        children: [
       const SizedBox(height: 20,),
       preferencesfield(_optionsskills, _selectedOptionsskills,"Add Skills"),
          preferencesfield(_optionsjobtitles, _selectedOptionsjobtitles,"Job Titles"),
         singlepreference(),
          preferencesfield(_optionsjoblocation, _selectedOptionslocations,"Location"),

          GestureDetector(
            onTap: ()async{
              updatePreference(widget.userID.toString(), _selectedOptionsskills, _selectedOptionsjobtitles, _selectedOption!,_selectedOptionsskills);
              await Future.delayed(Duration(seconds: 2));

              // Navigate to HomePage with userId
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(userID: widget.userID),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 70.0),
              child: Container(
                child: Card(
                  color: Colors.blue,
                  borderOnForeground: true,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 7),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Add",style:TextStyle(fontSize: 15,color:Colors.white,fontWeight: FontWeight.w500),),
                        ]
                    ),

                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
