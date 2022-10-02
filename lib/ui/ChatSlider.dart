
import 'package:authh_app/ui/Chat.dart';
import 'package:authh_app/ui/chat_wrtFirm.dart';
import 'package:authh_app/ui/chatwrtTenant.dart';
import 'package:flutter/material.dart';

class ChatSlider extends StatefulWidget {
 const ChatSlider({Key? key}) : super(key: key);

  @override
  State<ChatSlider> createState() => _ChatSliderState();
}

class _ChatSliderState extends State<ChatSlider> {
 
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
// #region AppBar()
      
// #endregion
      body:
    // Text(widget.usernameController)
       PageView(
        children: [
         ChatPage(),
         ChatwrtFirmPage(),
         ChatwrtTenantPage()
          
        ],
      ),
      );

  }}