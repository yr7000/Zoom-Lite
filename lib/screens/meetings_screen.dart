import 'dart:math';

import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:zoom_lite/resources/jitsi_meet_methods.dart';

import '../widgets/home_meeting_button.dart';

class MeetingsScreen extends StatelessWidget {
  MeetingsScreen({super.key});

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();
  createNewMeeting() async{
    var random = Random();
    String roomName = (random.nextInt(10000000) + 10000000).toString();
    _jitsiMeetMethods.createMeeting(roomName: roomName, isAudioMuted: true, isVideoMuted: true);
  }

  joinMeeting(BuildContext context){
    Navigator.pushNamed(context, "/videocall");
  }

  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HomeMeetingButton(
                icon: Icons.videocam,
                text: "New Meeting",
                onPressed: createNewMeeting,
              ),

              HomeMeetingButton(
                icon: Icons.add_box_rounded,
                text: "Join Meeting",
                onPressed: () => joinMeeting(context),
              ),

              HomeMeetingButton(
                icon: Icons.calendar_today,
                text: "Schedule",
                onPressed: (){
                  
                },
              ),

              HomeMeetingButton(
                icon: Icons.arrow_upward_rounded,
                text: "Share Screen",
                onPressed: (){
                  
                },
              )
            ],
          ),
        ),
        Expanded(
          child: Center(
            child: Text(
              "Create or Join a Meeting",
              style: GoogleFonts.robotoMono(
                fontWeight: FontWeight.bold,
                fontSize: 23,
              ), 
            ),
          )
        )
      ]
    );
  }
}