import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const Profile(),
    );
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          color: const Color(0xFFFFFFFF),
          child: const Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80),
                UserInfo(),
                SizedBox(height: 25),
                UserBio(),
                SizedBox(height: 25),
                UserHobbies(),
                SizedBox(height: 25),
                UserSkills(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              image: const DecorationImage(
                image: AssetImage('assets/images/photo.jpg'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(10.0),
            ),
            height: 120,
            width: 120,
          ),
          const SizedBox(width: 20),
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aidar Khabibullin',
                  style: GoogleFonts.gloriaHallelujah(
                    color: const Color(0xFF273242),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/location.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.red,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Russia, Gubkinsky',
                      style: GoogleFonts.shadowsIntoLight(fontSize: 20),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/svg/mail.svg',
                      colorFilter: const ColorFilter.mode(
                        Colors.purple,
                        BlendMode.srcIn,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'aydar.kh@gmail.com',
                      style: GoogleFonts.shadowsIntoLight(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class UserBio extends StatelessWidget {
  const UserBio({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/svg/bio.svg',
                colorFilter: const ColorFilter.mode(
                  Colors.orange,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Bio',
                style: GoogleFonts.gloriaHallelujah(
                  fontSize: 24,
                  color: Colors.orange,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'Aidar is a passionate mobile app developer and UI/UX designer based in Gubkinsky. He specializes in building beautiful, user-friendly apps for iOS and Android using Flutter and Dart. In his free time, Aidar enjoys blending creative smoothies, and staying active through weightlifting, yoga, and hiking. He is always looking for new challenges to expand his skills and bring great app ideas to life.',
            style: GoogleFonts.architectsDaughter(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class UserHobbies extends StatelessWidget {
  const UserHobbies({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/svg/hobbies.svg',
                colorFilter: const ColorFilter.mode(
                  Colors.blueAccent,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Hobbies',
                style: GoogleFonts.gloriaHallelujah(
                  fontSize: 24,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '- Smoothie-making - On weekends, Aidar enjoys coming up with new smoothie recipes packed with superfoods and fresh fruits. His specialty is açaí bowls.\n'
            '- Fitness - Aidar stays active by lifting weights 5 days a week, taking yoga classes, and going on weekend hikes. Exercise is his stress reliever.',
            style: GoogleFonts.architectsDaughter(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}

class UserSkills extends StatelessWidget {
  const UserSkills({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                'assets/svg/skills.svg',
                colorFilter: const ColorFilter.mode(
                  Colors.green,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 10),
              Text(
                'Skills',
                style: GoogleFonts.gloriaHallelujah(
                  fontSize: 24,
                  color: Colors.green,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            '- Flutter framework - 10 years experience building iOS and Android apps with Flutter.\n'
            '- Dart programming - Chad level Dart skills, including async/await, streams, and generics.\n'
            '- UI/UX design - Strong visual design ability and user empathy. Proficient in Figma and Adobe XD.',
            style: GoogleFonts.architectsDaughter(
              fontSize: 18,
            ),
          ),
        ],
      ),
    );
  }
}
