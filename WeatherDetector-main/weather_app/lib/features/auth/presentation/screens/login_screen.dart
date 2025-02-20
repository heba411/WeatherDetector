import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/core/style/colors.dart';
import 'package:weather_app/features/auth/presentation/cubit/auth_states.dart';
import 'package:weather_app/features/auth/presentation/screens/signup_screen.dart';
import 'package:weather_app/features/auth/presentation/screens/weather_screen.dart';
import '../../../../core/components/components.dart';
import '../../../../core/helper/cashe.dart';
import '../cubit/auth_cubit.dart';


class LoginScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state){
          if(state is LoginErrorState)
          {
            showToast(msg: state.error, state: ToastStates.ERROR);
          }
          if(state is LoginSuccessState)
          {
            CacheHelper.saveData(
              key: 'uID',
              value: state.uId,
            ).then((value){
              // showToast(msg: 'Logged in successfully', state: ToastStates.SUCCESS);
              Navigator.push(context, MaterialPageRoute(builder: (context)=> WeatherScreen(),));
            });
          }
        },
        builder:(context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 130,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Text(
                          'Login',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              color: PRIMARY_COLOR,
                              fontSize: 30,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(height: 25,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: defaultTextFormField(
                            control: email,
                            prefIcon: Icons.email_outlined,
                            label: 'Email',
                            validate: (value){
                              if(value!.isEmpty)
                              {
                                return 'Enter your email';
                              }
                              return null;
                            },
                            textInputType: TextInputType.text),
                      ),
                      SizedBox(height: 25,),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: defaultTextFormField(
                            control: password,
                            prefIcon: Icons.lock_outline,
                            label: 'Password',
                            validate: (value){
                              if(value!.isEmpty)
                              {
                                return 'Enter your password';
                              }
                              return null;
                            },
                            suffxIcon:AuthCubit.get(context).passwordIcon,
                            onPressedSuffix: (){
                              AuthCubit.get(context).togglePasswordVisibility();
                            },
                            isPassword: AuthCubit.get(context).isPasswordHidden,
                            textInputType: TextInputType.text),
                      ),
                      SizedBox(height: 30,),
                      ConditionalBuilder(
                        condition: state is! LoginLoadingState,
                        builder: (context) => Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: defaultButton(function: (){
                            if(formKey.currentState!.validate())
                            {
                              AuthCubit.get(context).login(email.text, password.text);
                            }
                          }, text: 'Sign in',isElevated: true),
                        ),
                        fallback: (context) => Center(child: CircularProgressIndicator(color: Colors.black,)),
                      ),
                      SizedBox(height: 50,),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 14
                              ),
                            ),
                            TextButton(onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=> SignupScreen(),));
                            },
                              child: Text(
                                'Sign up',
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
