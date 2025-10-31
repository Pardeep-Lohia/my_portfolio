import 'package:flutter/material.dart';

class ProjectData {
  static const List<Map<String, dynamic>> projects = [
    {
      "title": "EnggiQuest",
      "description":
          "Quiz app for GATE preparation with branch-specific modes, query search using Gemini API, and Firebase backend.",
      "tech": ["Flutter", "Firebase", "Gemini API"],
      "github": "https://github.com/MadirakshiJain/quiz_app_1",
      "deployed": "https://example.com/deployed-enggiquest",
      "color": Colors.blue,
      "icon": Icons.quiz,
      "status": "Completed",
    },
    // {
    //   "title": "Sign Language Learning App",
    //   "description": "AI-powered app for learning sign language with dictionary, quotes, word of the day, and posture correction.",
    //   "tech": ["Flutter", "Firebase", "AI/ML"],
    //   "github": "https://github.com/pardeep-lohia/SignLanguageApp",
    //   "deployed": "https://example.com/deployed-signlanguage",
    //   "color": Colors.green,
    //   "icon": Icons.sign_language,
    //   "status": "Completed"
    // },
    {
      "title": "EduSphere",
      "description":
          "EdTech platform developed during a hackathon for collaborative learning and engagement.",
      "tech": ["Flutter", "Firebase"],
      "github": "https://github.com/Pardeep-Lohia/Project_Submition_CGC/tree/main/flutter_application_1",
      "deployed": "https://edusphere-web.vercel.app/",
      "color": Colors.purple,
      "icon": Icons.school,
      "status": "Hackathon Winner",
    },
    {
  "title": "StudyBuddy",
  "description":
      "An intelligent study companion that helps students organize notes, ask AI-based questions, and get contextual answers using RAG and Gemini integration.",
  "tech": ["Flutter", "FastAPI", "Gemini API", "ChromaDB"],
  "github": "https://github.com/Pardeep-Lohia/newCloudCosmos", // replace with your actual repo link if different
  "deployed": "https://example.com/deployed-StudyBuddy", // replace if deployed elsewhere
  "color": Colors.blueAccent,
  "icon": Icons.psychology,
  "status": "In Development",
},

    // {
    //   "title": "Mess Account Management System",
    //   "description": "Java & MySQL-based app for managing mess accounts, menu, and billing.",
    //   "tech": ["Java", "MySQL"],
    //   "github": "https://github.com/pardeep-lohia/MessManagement",
    //   "deployed": "https://example.com/deployed-mess",
    //   "color": Colors.orange,
    //   "icon": Icons.restaurant,
    //   "status": "Completed"
    // },
    // {
    //   "title": "Student Management System",
    //   "description": "Tkinter desktop application integrated with MySQL for student data management.",
    //   "tech": ["Python", "Tkinter", "MySQL"],
    //   "github": "https://github.com/pardeep-lohia/StudentManagement",
    //   "deployed": "https://example.com/deployed-student",
    //   "color": Colors.teal,
    //   "icon": Icons.people,
    //   "status": "Completed"
    // },
    // {
    //   "title": "Motion Detection & Character Animation",
    //   "description": "Detects body, face, and hand movements from video using MediaPipe & OpenCV.",
    //   "tech": ["Python", "MediaPipe", "OpenCV"],
    //   "github": "https://github.com/pardeep-lohia/MotionDetection",
    //   "deployed": "https://example.com/deployed-motion",
    //   "color": Colors.red,
    //   "icon": Icons.videocam,
    //   "status": "Completed"
    // },
  ];

  static Map<String, List<String>> getSkillProjectMapping() {
    return {
      "Flutter": ["EnggiQuest", "Sign Language Learning App", "EduSphere"],
      "Firebase": ["EnggiQuest", "Sign Language Learning App", "EduSphere"],
      "Java": ["Mess Account Management System"],
      "Python": [
        "Student Management System",
        "Motion Detection & Character Animation",
      ],
      "Dart": ["EnggiQuest", "Sign Language Learning App", "EduSphere"],
      "MySQL": ["Mess Account Management System", "Student Management System"],
      "MediaPipe": ["Motion Detection & Character Animation"],
      "OpenCV": ["Motion Detection & Character Animation"],
      "Tkinter": ["Student Management System"],
    };
  }

  static List<Map<String, dynamic>> getProjectsForSkill(String skill) {
    final projectNames = getSkillProjectMapping()[skill] ?? [];
    return projects
        .where((project) => projectNames.contains(project['title']))
        .toList();
  }
}
