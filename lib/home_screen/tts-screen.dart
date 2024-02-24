//! PRUEBA TEXT TO SPEECH

// import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:segundo_proyecto/consts.dart';

// class TtsScreen extends StatefulWidget {
//   const TtsScreen({super.key});

//   @override
//   State<TtsScreen> createState() => _TtsScreenState();
// }

// class _TtsScreenState extends State<TtsScreen> {
//   FlutterTts _flutterTTS = FlutterTts();
//   Map? _currentVoice;
//   int? _wordStart, _wordEnd;
//   List<Map> _voices = [];

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     initTTS();
//   }

//   void initTTS() {
//     //_flutterTTS.setLanguage("es-MX");
//     _flutterTTS.setProgressHandler((text, start, end, word) {
//       setState(() {
//         _wordStart = start;
//         _wordEnd = end;
//       });
//     });
//     _flutterTTS.getVoices.then((data) {
//       try {
//         _voices = List<Map>.from(data);

//         //print(_voices);
//         setState(() {
//           _voices =
//               _voices.where((_voice) => _voice["name"].contains("es")).toList();
//           _currentVoice == _voices.first;
//           setVoice(_currentVoice!);
//         });
//       } catch (e) {
//         print(e);
//       }
//     });
//   }

//   void setVoice(Map voice) {
//     _flutterTTS.setVoice({"name": voice["name"], "locales": voice["locale"]});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("TTS prueba"),
//       ),
//       body: _buildUI(),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _flutterTTS.speak(TTS_INPUT);
//         },
//         child: Icon(Icons.speaker),
//       ),
//     );
//   }

//   Widget _buildUI() {
//     return SafeArea(
//         child: Column(
//       mainAxisSize: MainAxisSize.max,
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         _speakerSelector(),
//         RichText(
//           textAlign: TextAlign.center,
//           text: TextSpan(
//             style: TextStyle(
//                 fontWeight: FontWeight.w300, fontSize: 20, color: Colors.black),
//             children: <TextSpan>[
//               TextSpan(text: TTS_INPUT.substring(0, _wordStart)),
//               if (_wordStart != null)
//                 TextSpan(
//                   text: TTS_INPUT.substring(_wordStart!, _wordEnd),
//                   style: const TextStyle(
//                     color: Colors.white,
//                     backgroundColor: Colors.purple,
//                   ),
//                 ),
//               if (_wordStart != null)
//                 TextSpan(
//                   text: TTS_INPUT.substring(_wordEnd!),
//                 ),
//             ],
//           ),
//         ),
//       ],
//     ));
//   }

//   Widget _speakerSelector() {
//     return DropdownButton(
//         value: _currentVoice,
//         items: _voices
//             .map(
//               (_voice) => DropdownMenuItem(
//                 value: _voices,
//                 child: Text(_voice["name"]),
//               ),
//             )
//             .toList(),
//         onChanged: (value) {});
//   }
// }
