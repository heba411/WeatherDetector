import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/components/components.dart';
import 'package:weather_app/core/style/colors.dart';
import 'package:weather_app/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:weather_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:weather_app/features/auth/presentation/screens/login_screen.dart';

class SignupScreen extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var name = TextEditingController();
    var email = TextEditingController();
    var phone = TextEditingController();
    var password = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return  BlocConsumer<AuthCubit, AuthStates>(
        listener: (context,state) {
          if (state is SignUpSuccessState)
          {
            showToast(msg: 'Signup Successful!', state: ToastStates.SUCCESS);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen(),));
          } else if (state is SignUpErrorState)
          {
            showToast(msg: state.error, state: ToastStates.ERROR);
          }
        },
        builder: (context,state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: screenWidth * 0.25,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                        child: Text(
                          'Sign up',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: PRIMARY_COLOR,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(height: screenWidth * 0.05,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                        child: defaultTextFormField(
                            control: name,
                            prefIcon: Icons.person,
                            label: 'Name',
                            validate: (value){
                              if(value!.isEmpty)
                              {
                                return 'Enter your name';
                              }
                              return null;
                            },
                            textInputType: TextInputType.text),
                      ),
                      SizedBox(height: screenWidth * 0.05,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                        child: defaultTextFormField(
                            control: email,
                            prefIcon: Icons.email,
                            label: 'Email',
                            validate: (value){
                              if(value!.isEmpty)
                              {
                                return 'Enter your email';
                              }
                              return null;
                            },
                            textInputType: TextInputType.emailAddress),
                      ),
                      SizedBox(height: screenWidth * 0.055,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                        child: defaultTextFormField(
                            control: phone,
                            prefIcon: Icons.phone,
                            label: 'Phone',
                            validate: (value){
                              if(value!.isEmpty)
                              {
                                return 'Enter your phone';
                              }
                              return null;
                            },
                            textInputType: TextInputType.phone),
                      ),
                      SizedBox(height: screenWidth * 0.05,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                        child: defaultTextFormField(
                            control: password,
                            prefIcon: Icons.lock,
                            label: 'Password',
                            validate: (value){
                              if(value!.isEmpty)
                              {
                                return 'Enter your password';
                              }
                              return null;
                            },
                            suffxIcon: AuthCubit.get(context).passwordIcon,
                            onPressedSuffix: (){
                              AuthCubit.get(context).togglePasswordVisibility();
                            },
                            isPassword: AuthCubit.get(context).isPasswordHidden,
                            textInputType: TextInputType.text),
                      ),
                      SizedBox(height: screenWidth * 0.05,),
                      ConditionalBuilder(
                        condition: state is! SignUpLoadingState,
                        builder: (context) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                          child: defaultButton(function: (){
                            if(formKey.currentState!.validate())
                            {
                              AuthCubit.get(context).signUp(
                                  name: name.text,
                                  phone: phone.text,
                                  email: email.text,
                                  password: password.text
                              ).then((value){
                                // Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen(),));
                              });
                            }
                          }, text: 'Sign up',isElevated: true),
                        ),
                        fallback: (context) => Center(child: CircularProgressIndicator(color: Colors.black,)),
                      ),
                      SizedBox(height: screenWidth * 0.1,),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Already have an account?',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14
                              ),
                            ),
                            TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> LoginScreen(),));
                            },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 14
                                ),
                              ),),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
    );
  }
}