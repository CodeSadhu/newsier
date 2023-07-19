import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/providers/news_provider.dart';
import 'package:news_app/screens/splash.dart';
import 'package:news_app/utils/credentials.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Read the API key from the keys.txt file
  // Create a keys.txt file inside 'lib' folder and paste API key directly for this to work
  Credentials.apiKey = await getApiKey();

  runApp(const MyApp());
}

Future<String> getApiKey() async {
  String apiKey = '';
  try {
    // Read the contents of the keys.txt file.
    apiKey = await rootBundle.loadString('lib/keys.txt');
  } catch (error) {
    debugPrint("Error reading the API key: $error");
  }
  return apiKey;
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => NewsProvider(),
        )
      ],
      child: const MaterialApp(
        home: SplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
