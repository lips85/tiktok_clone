// import 'package:flutter/material.dart';
// import 'package:sign_in_button/sign_in_button.dart';

// class SignUpScreen extends StatelessWidget {
//   const SignUpScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 24.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const SizedBox(height: 20),
//               Image.network(
//                 'https://upload.wikimedia.org/wikipedia/en/6/60/Twitter_Logo_as_of_2021.svg',
//                 height: 50,
//               ),
//               const SizedBox(height: 50),
//               const Text(
//                 'See what\'s happening in the world right now.',
//                 style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 50),
//               SignInButton(
//                 Buttons.google,
//                 onPressed: () {
// // 구글 로그인 처리 코드
//                 },
//               ),
//               SignInButton(
//                 Buttons.apple,
//                 onPressed: () {
// // 애플 로그인 처리 코드
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
// // 계정 생성 처리 코드
//                 },
//                 child: const Text('Create account'),
//               ),
//               const SizedBox(height: 20),
//               const Text.rich(
//                 TextSpan(
//                   text: 'By signing up, you agree to our ',
//                   children: [
//                     TextSpan(
//                       text: 'Terms',
//                       style: TextStyle(color: Colors.blue),
// // 클릭 시 처리 코드 추가 가능
//                     ),
//                     TextSpan(text: ', '),
//                     TextSpan(
//                       text: 'Privacy Policy',
//                       style: TextStyle(color: Colors.blue),
// // 클릭 시 처리 코드 추가 가능
//                     ),
//                     TextSpan(text: ', and '),
//                     TextSpan(
//                       text: 'Cookie Use',
//                       style: TextStyle(color: Colors.blue),
// // 클릭 시 처리 코드 추가 가능
//                     ),
//                   ],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               const SizedBox(height: 20),
//               TextButton(
//                 onPressed: () {
// // 로그인 화면으로 이동 처리 코드
//                 },
//                 child: const Text('Have an account already? Log in'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
