//! PRUEBA SPEECH TO TEXT

// import 'package:flutter/material.dart';
// import 'package:speech_to_text/speech_to_text.dart';
// import 'package:flutter_tts/flutter_tts.dart';
// import 'package:segundo_proyecto/consts.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   final SpeechToText _speech = SpeechToText();
//   bool _speechEnable = false;
//   String _tanscriptionSpeech = '';
//   double _confidenceLeve = 0;
//   @override
//   void initState() {
//     super.initState();
//     initSpeech();
//   }

//   void initSpeech() async {
//     _speechEnable = await _speech.initialize();
//     debugPrint('Inizializado');
//     setState(() {});
//   }

//   void _startListening() async {
//     await _speech.listen(onResult: _onSpeechResult);
//     debugPrint('Iniciado y En Escucha');
//     setState(() {
//       _confidenceLeve = 0;
//     });
//   }

//   void _onSpeechResult(result) {
//     debugPrint('Resultado Emitido');
//     setState(() {});
//     _tanscriptionSpeech = '${result.recognizedWords}';
//     _confidenceLeve = result.confidence;
//   }

//   void _stopListening() async {
//     debugPrint('Detenido Y Fin');
//     await _speech.stop();
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.purple,
//         title: Text(
//           'Prueba',
//           style: TextStyle(color: Colors.white),
//         ),
//       ),
//       body: Center(
//         child: Column(
//           children: [
//             Container(
//               padding: EdgeInsets.all(16),
//               child: Text(_speech.isListening
//                   ? 'Escuchando'
//                   : _speechEnable
//                       ? 'toca el microfono para escuchar...'
//                       : 'speech no habilitado'),
//             ),
//             Expanded(
//                 child: Container(
//               padding: EdgeInsets.all(16),
//               child: Text(
//                 _tanscriptionSpeech,
//                 style:
//                     const TextStyle(fontSize: 25, fontWeight: FontWeight.w300),
//               ),
//             )),
//             // if (_speech.isNotListening && _confidenceLeve > 0)
//             //   Text(
//             //     'Nivel de Confianza: ${(_confidenceLeve * 100).toStringAsFixed(1)}',
//             //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.w200),
//             //   ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _speech.isListening ? _stopListening : _startListening,
//         tooltip: 'Escuchando...',
//         child: Icon(_speech.isNotListening ? Icons.mic_off : Icons.mic),
//       ),
//     );
//   }
// }
