import'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:job_recommendation/login.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  final TextEditingController _confirmpassController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _confirmpassController .dispose();
    _passwordController.dispose();
    super.dispose();
  }
  bool _isChecked = false;

  bool _isSecurePassword=true;

  Widget togglePassword(){
    return IconButton(onPressed: (){
      setState(() {
        _isSecurePassword=!_isSecurePassword;
      });

    }, icon: _isSecurePassword?Icon(Icons.visibility):Icon(Icons.visibility_off));
  }

  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body: ListView(
        children: [
          Container(
            height: size.height*0.1,

            child: Card(
              // color: Color(0xffEEEDFB),
              color: Colors.white,
              elevation: 0.8,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(children: [
                  Text("👋",style:TextStyle(fontSize: 30),),
                  SizedBox(width: size.width*0.04,),

                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Hi, Unstoppable",style:TextStyle(fontSize: 10),),
                      Text("Create an account",style:TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
                    ],)
                ],),
                //child: Text("Book a consultation",style:GoogleFonts.sora(fontSize: 15,color: Colors.white),),
              ),
            ),
          ),
          const SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text("Create account as",style:TextStyle(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.w500),),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              Container(
                height: size.height*0.1,
                width: size.width*0.27,
                decoration: BoxDecoration(border: Border.all(color: Colors.grey,),borderRadius: BorderRadius.circular(10),color: Colors.white,),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                   crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      Icon(Icons.person_outline),
                        Text("Candidate",style:TextStyle(fontSize: 12,color: Color(0xff00008B),fontWeight: FontWeight.w500),),
                      ]
                  ),
                  //child: Text("Book a consultation",style:GoogleFonts.sora(fontSize: 15,color: Colors.white),),
                ),
              ),
              const SizedBox(width: 20,),
              Container(
                height: size.height*0.1,
                width: size.width*0.27,
                decoration: BoxDecoration(border: Border.all(color: Colors.grey,),borderRadius: BorderRadius.circular(10),color: Colors.white,),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                      FaIcon(FontAwesomeIcons.buildingUser),
                        Text("Company",style:TextStyle(fontSize: 12,color: Color(0xff00008B),fontWeight: FontWeight.w500),),
                      ]
                  ),
                  //child: Text("Book a consultation",style:GoogleFonts.sora(fontSize: 15,color: Colors.white),),
                ),
              ),
              const SizedBox(width: 20,),
              Container(
                height: size.height*0.1,
                width: size.width*0.27,
                decoration: BoxDecoration(border: Border.all(color: Colors.grey,),borderRadius: BorderRadius.circular(10),color: Colors.white,),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FaIcon(FontAwesomeIcons.school),
                        Text("College",style:TextStyle(fontSize: 12,color: Color(0xff00008B),fontWeight: FontWeight.w500),),
                      ]
                  ),
                ),
              )
            ],),
          ),
          const SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox( // Wrap with SizedBox to provide width constraint
                  width: size.width*0.42, // Set width to match parent width

                  child: TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        // borderSide: BorderSide(color: _borderColor), // Border color
                      ),
                      hintText: 'First Name',
                      labelText: 'First Name',
                      labelStyle: TextStyle(fontSize: 13, color:  Colors.grey, fontWeight: FontWeight.w600,),
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
                    ),
                    controller: TextEditingController(),
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Enter name';
                      }
                      return null;
                    },
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox( // Wrap with SizedBox to provide width constraint
                  width: size.width*0.42, // Set width to match parent width
                  child: TextFormField(

                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        // borderSide: BorderSide(color: _borderColor), // Border color
                      ),
                      hintText: 'Last Name',
                      labelText: 'Last Name',
                      labelStyle: TextStyle(fontSize: 13, color: Colors.grey, fontWeight: FontWeight.w600),
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
                    ),
                    controller: TextEditingController(),
                    obscureText: false,
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Enter name';
                      }
                      return null;
                    },
                  ),
                ),
              )

            ],
          ),

          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              //color: Colors.black,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: 'User Name',
                labelText:'User Name',
                hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
                labelStyle:   TextStyle(fontSize: 13,color:  Colors.grey,fontWeight: FontWeight.w600),


              ),

              obscureText: false,
              keyboardType: TextInputType.text,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Enter username';
                }
                return null;
              },
            ),
          ),

          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              //color: Colors.black,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
                labelText:'Email',
                labelStyle:   TextStyle(fontSize: 13,color:  Colors.grey,fontWeight: FontWeight.w600),
                prefixIconColor: Colors.grey,
                suffixIconColor: Colors.grey,
              ),
              keyboardType: TextInputType.text,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Enter email';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              //color: Colors.black,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                hintText: 'Phone',
                hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
              ),
              keyboardType: TextInputType.text,
              validator: (String? value) {
                if (value!.isEmpty) {
                  return 'Enter your phone';
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox( // Wrap with SizedBox to provide width constraint
                  width: size.width*0.42, // Set width to match parent width

                  child:TextFormField(
                    //color: Colors.black,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: 'Password',
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
                      labelText:'Password',
                      labelStyle:   TextStyle(fontSize: 13,color:  Colors.grey,fontWeight: FontWeight.w600),
                      prefixIconColor: Colors.grey,
                      suffixIconColor: Colors.grey,
                      suffixIcon: togglePassword(),

                    ),
                    controller: _passwordController,
                    obscureText: _isSecurePassword,
                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Enter password';
                      }
                      return null;
                    },
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: SizedBox( // Wrap with SizedBox to provide width constraint
                  width: size.width*0.42, // Set width to match parent width
                  child: TextFormField(
                    //color: Colors.black,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      hintText: 'Confirm Password',
                      hintStyle: TextStyle(color: Colors.grey,fontSize: 13),
                      prefixIconColor: Colors.grey,
                      labelText:'Confirm Password',
                      labelStyle:   TextStyle(fontSize: 13,color:  Colors.grey,fontWeight: FontWeight.w600),

                    ),

controller: _confirmpassController,

                    keyboardType: TextInputType.text,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Confirm password';
                      }
                      return null;
                    },
                  ),
                ),
              )

            ],
          ),
          Padding(
            padding: const EdgeInsets.all(7.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Center the content horizontally
              children: [
                Checkbox(
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    "All your information is collected, stored, and processed as per our data processing guidelines. By signing up on Unstop, you agree to our Privacy Policy and Terms of Use",
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500, color: Colors.grey),

                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: (){
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text("Already have an account?",style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.grey)),
                  Text("Login",style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Color(0xff04BADE),)),
                 const SizedBox(width: 20,),
                  Container(
                    //decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color: Colors.blue,),
                    child: Card(
                      color: Colors.blue,
                      borderOnForeground: true,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0,vertical: 7),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Next",style:TextStyle(fontSize: 15,color:Colors.white,fontWeight: FontWeight.w500),),
                            ]
                        ),

                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
