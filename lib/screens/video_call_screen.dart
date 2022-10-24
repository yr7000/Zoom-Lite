import "package:flutter/material.dart";
import 'package:jitsi_meet/jitsi_meet.dart';
import 'package:zoom_lite/resources/auth_methods.dart';
import 'package:zoom_lite/resources/jitsi_meet_methods.dart';
import 'package:zoom_lite/utils/colors.dart';
import 'package:zoom_lite/widgets/meeting_option.dart';

class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late TextEditingController meetingIdController;
  late TextEditingController nameController;
  final AuthMethods _authMethods = AuthMethods();

  final JitsiMeetMethods _jitsiMeetMethods = JitsiMeetMethods();

  bool isAudioMuted = true;
  bool isVideoMuted = true;

  @override
  void initState() {
    meetingIdController = TextEditingController();
    nameController = TextEditingController(text: _authMethods.user.displayName);
    super.initState();
  }

  @override
  void dispose(){
    super.dispose();
    meetingIdController.dispose();
    nameController.dispose();
    JitsiMeet.removeAllListeners();
  }

  _joinMeeting(){
    _jitsiMeetMethods.createMeeting(roomName: meetingIdController.text, isAudioMuted: isAudioMuted, isVideoMuted: isVideoMuted, username: nameController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: backgroundColor,
        title: const Text("Join a Meeting", style: TextStyle(fontSize: 18),),
        centerTitle: true,
      ),

      body: Column(
        children: [
          const SizedBox(height: 30,),
          SizedBox(
            height: 60,
            child: TextField(
              controller: nameController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                fillColor: secondaryBackgroundColor,
                filled: true,
                labelText: "Name",
                contentPadding: EdgeInsets.fromLTRB(20,10,0,0),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            child: TextField(
              controller: meetingIdController,
              maxLines: 1,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                fillColor: secondaryBackgroundColor,
                filled: true,
                border: OutlineInputBorder(),
                labelText: "Room ID",
                contentPadding: EdgeInsets.fromLTRB(20,10,0,0),
              ),
            ),
          ),

          const SizedBox(height: 20,),

          InkWell(
            onTap: _joinMeeting,
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text("Join", style: TextStyle(fontSize: 16),),
            ),
          ),

          const SizedBox(height: 20,),

          MeetingOption(text: "Turn off my audio", isDisabled: isAudioMuted, onChange: onAudioMuted),
          MeetingOption(text: "Turn off my video", isDisabled: isVideoMuted, onChange: onVideoMuted),
        ],
      ),

    );
  }

  onAudioMuted(bool? value){
    setState(() {
      isAudioMuted = value!;
    });
  }
  onVideoMuted(bool? value){
    setState(() {
      isVideoMuted = value!;
    });
  }
}