import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/02_tweeter/features/authentication/widgets/common_button.dart';

class InterestsScreenTweet extends StatefulWidget {
  const InterestsScreenTweet({super.key});

  @override
  _InterestsScreenTweetState createState() => _InterestsScreenTweetState();
}

class _InterestsScreenTweetState extends State<InterestsScreenTweet> {
  final List<String> interests = [
    "Fashion & beauty",
    "Outdoors",
    "Arts & culture",
    "Animation & comics",
    "Business & finance",
    "Food",
    "Travel",
    "Entertainment",
    "Music",
    "Gaming"
  ];
  final Set<String> selectedInterests = {};

  void _toggleInterest(String interest) {
    setState(() {
      if (selectedInterests.contains(interest)) {
        selectedInterests.remove(interest);
      } else {
        selectedInterests.add(interest);
      }
    });
  }

  void _onNextTap() {
    if (selectedInterests.length >= 3) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const InterestsPartTwoScreen(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const FaIcon(
          FontAwesomeIcons.twitter,
          size: 28,
          color: Color(0xff4E98E9),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 20),
              const Text(
                "What do you want to see on Twitter?",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              const Text(
                "Select at least 3 interests to personalize your Twitter experience. They will be visible on your profile.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: interests.map((interest) {
                      final isSelected = selectedInterests.contains(interest);
                      return ChoiceChip(
                        label: Text(interest),
                        selected: isSelected,
                        onSelected: (_) => _toggleInterest(interest),
                        selectedColor: Colors.blue,
                        backgroundColor: Colors.grey[200],
                        labelStyle: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ),
              Text(
                "${selectedInterests.length} of 3 selected",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              CommonButton(
                textChange: false,
                validate: selectedInterests.length >= 3,
                colorChange: true,
                changeColor: Colors.black,
                text: "Next",
                onPressed: _onNextTap,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class InterestsPartTwoScreen extends StatelessWidget {
  const InterestsPartTwoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interests Part Two"),
      ),
      body: const Center(
        child: Text("Interests Part Two Screen"),
      ),
    );
  }
}
