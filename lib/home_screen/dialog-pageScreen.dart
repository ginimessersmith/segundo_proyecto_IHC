import 'package:flutter/material.dart';
import 'package:dialog_flowtter/dialog_flowtter.dart';
import 'package:segundo_proyecto/home_screen/messagesScreen.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:flutter_tts/flutter_tts.dart';

class DialogFlow extends StatefulWidget {
  const DialogFlow({super.key});
  @override
  State<DialogFlow> createState() => _DialogFlowState();
}

class _DialogFlowState extends State<DialogFlow> {
  // var speech to text:
  final SpeechToText _speech = SpeechToText();
  bool _speechEnable = false;
  String _tanscriptionSpeech = '';
  double _confidenceLeve = 0;
  // text to speech:
  FlutterTts _flutterTTS = FlutterTts();
  Map? _currentVoice;
  List<Map> _voices = [];
  // dialog flowtter:
  late DialogFlowtter dialogFlowtter;
  final TextEditingController _controller = TextEditingController();
  List<Map<String, dynamic>> messages = [];
  String? textResponseDialogFlow = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DialogFlowtter.fromFile().then((instance) => dialogFlowtter = instance);
    initSpeech();
    initTTS();
    //_startListening();
  }

  //star tts text to speech:
  void initTTS() {
    _flutterTTS.setLanguage("es-MX");
    _flutterTTS.getVoices.then((data) {
      try {
        _voices = List<Map>.from(data);
        setState(() {
          _voices = _voices
              .where((_voice) => _voice["name"].contains("es-MX"))
              .toList();
          _currentVoice = _voices.first;
          setVoice(_currentVoice!);
        });
      } catch (e) {
        print(e);
      }
    });
  }

  void setVoice(Map voice) {
    print(voice);
    _flutterTTS.setVoice({"name": voice["name"], "locale": voice["locale"]});
  }

// start speech to text:
  void initSpeech() async {
    _speechEnable = await _speech.initialize(onStatus: (status) {});
    _startListening();
    debugPrint('Inicializado');
    setState(() {});
  }

  void _startListening() async {
    await _speech.listen(
        onResult: _onSpeechResult, listenFor: const Duration(hours: 1));
    debugPrint('Iniciado y En Escucha');
    setState(() {});
  }

  void _stopListening() async {
    debugPrint('Detenido Y Fin');
    await _speech.stop();
    setState(() {});
  }

  void _onSpeechResult(result) {
    debugPrint('Resultado Emitido');
    print('${result.recognizedWords}');
    if (result.finalResult) {
      sendMessage(result.recognizedWords);
    }
    //sendMessage(result.recognizedWords);
    //_startListening();
    setState(() {
      _tanscriptionSpeech = '${result.recognizedWords}';
      _confidenceLeve = result.confidence;
      print('${_tanscriptionSpeech}');
    });
  }

  // speak(String text) async {
  //   await _flutterTTS.speak(text);
  // }

// end speech to text
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gino Store'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              _tanscriptionSpeech.isEmpty
                  ? 'Pulsa el boton para hablar'
                  : _tanscriptionSpeech,
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
          const SizedBox(width: 10),
          Container(
            padding: const EdgeInsets.all(16),
            child: Text(
              textResponseDialogFlow == null
                  ? ''
                  : '${textResponseDialogFlow!}',
              style: const TextStyle(fontSize: 20.0),
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
            onPressed:
                _speech.isNotListening ? _startListening : _stopListening,
            //     () {
            //   print('Verificacion del : ${_speech.isNotListening}');
            // },
            child: Icon(_speech.isNotListening ? Icons.mic_off : Icons.mic),
          ),
        ],
      ),
    );
  }

  sendMessage(String textInput) async {
    if (textInput.isEmpty) {
      print('mensaje vacio');
      print('el input text es: ${textInput}');
    } else {
      setState(() {
        addMessage(
          Message(text: DialogText(text: [textInput])),
          true,
        );
      });
      DetectIntentResponse response = await dialogFlowtter.detectIntent(
          queryInput: QueryInput(text: TextInput(text: textInput)));
      textResponseDialogFlow = response.text;
      _flutterTTS.speak(textResponseDialogFlow!);
      if (response.message == null) {
        return;
      } else {
        setState(() {
          addMessage(response.message!);
        });
      }
    }
  }

  addMessage(Message textMessage, [bool isUserMessage = false]) {
    messages.add({"message": textMessage, "isUserMessage": isUserMessage});
  }
}
