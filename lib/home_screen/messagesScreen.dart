//! PRUEBA DIALOG FLOW

// import 'package:flutter/material.dart';

// class MessageScreen extends StatefulWidget {
//   final List messages;
//   const MessageScreen({super.key, required this.messages});

//   @override
//   State<MessageScreen> createState() => _MessageScreenState();
// }

// class _MessageScreenState extends State<MessageScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView.separated(
//       separatorBuilder: (context, index) =>
//           const Padding(padding: EdgeInsets.only(top: 10)),
//       itemCount: widget.messages.length,
//       itemBuilder: (context, index) {
//         return Container(
//           margin: const EdgeInsets.all(10),
//           child: Row(
//             mainAxisAlignment: widget.messages[index]["isUserMessage"]
//                 ? MainAxisAlignment.end
//                 : MainAxisAlignment.start,
//             children: [
//               Flexible(
//                   child: Container(
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     topLeft: Radius.circular(20),
//                     bottomRight: Radius.circular(
//                         widget.messages[index]["isUserMessage"] ? 0 : 20),
//                     topRight: Radius.circular(
//                         widget.messages[index]["isUserMessage"] ? 20 : 0),
//                   ),
//                   color: widget.messages[index]["isUserMessage"]
//                       ? Colors.deepPurple
//                       : Colors.green,
//                 ),
//                 child: Text(
//                   widget.messages[index]["message"].text.text[0],
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ))
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
