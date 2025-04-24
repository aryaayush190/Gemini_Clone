// ✅ main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gemini_clone/feature/chat/bloc/gemini_chat_bloc.dart';
import 'views/chat_screen.dart';

void main() {
  runApp(const GeminiApp());
}

class GeminiApp extends StatefulWidget {
  const GeminiApp({super.key});

  @override
  State<GeminiApp> createState() => _GeminiAppState();
}

class _GeminiAppState extends State<GeminiApp> {
  bool isLightMode = true;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder:
          (_, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Gemini Clone',
            theme: isLightMode ? ThemeData.light() : ThemeData.dark(),
            home: BlocProvider(
              create: (_) => GeminiChatBloc(),
              child: ChatScreen(),
            ),
            builder: (context, child) {
              return Scaffold(
                appBar: AppBar(
                  title: const Text('Gemini'),
                  actions: [
                    DropdownButton<String>(
                      value: '2.0 Flash',
                      icon: const Icon(Icons.arrow_drop_down),
                      items:
                          <String>['2.0 Flash', '1.0 Stable']
                              .map(
                                (String value) => DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                ),
                              )
                              .toList(),
                      onChanged: (_) {},
                    ),

                    IconButton(
                      onPressed: () {
                        setState(() {
                          isLightMode = !isLightMode;
                        });
                      },
                      icon: Icon(isLightMode ? Icons.sunny : Icons.nightlight),
                    ),
                    IconButton(
                      icon: const CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Text('E', style: TextStyle(color: Colors.white)),
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                body: child,
              );
            },
          ),
    );
  }
}
