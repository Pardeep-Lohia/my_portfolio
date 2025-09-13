import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ExperienceScreen extends StatelessWidget {
  const ExperienceScreen({super.key});

  final List<Map<String, dynamic>> experiences = const [
    {
      "title": "6-weeks training at Future Finders",
      "organization": "Future Finders",
      "period": "June 2024 – July 2024",
      "description":
          "Complete 6-week training and build minnor projects",
      "achievements": [
        "learn python and basics of Machine learning",
        "Build minnor project",
        "complete 6-week training",
      ],
      "color": Colors.blue,
      "icon": Icons.group,
    },
    {
      "title": "Core Member & Flutter Developer",
      "organization": "GDSC Punjabi University",
      "period": "Sep 2024 – Present",
      "description":
          "Active member of Google Developer Student Clubs contributing to the tech community through Flutter development and mentorship.",
      "achievements": [
        "Conducted Flutter workshop as mentor for fellow students",
        "Built and contributed to cross-platform mobile applications",
        "Collaborated on Firebase-integrated projects",
        "Participated in hackathons and coding competitions",
      ],
      "color": Colors.blue,
      "icon": Icons.group,
    },
    {
      "title": "Flutter Workshop Mentor",
      "organization": "GDSC Punjabi University",
      "period": "Nov 2024",
      "description":
          "Led interactive workshop sessions teaching Flutter development fundamentals to students.",
      "achievements": [
        "Prepared comprehensive workshop materials",
        "Demonstrated practical Flutter app development",
        "Mentored students through hands-on exercises",
        "Received positive feedback from participants",
      ],
      "color": Colors.green,
      "icon": Icons.school,
    },
    {
      "title": "Hackathon Participant",
      "organization": "Various Events",
      "period": "feb 2025",
      "description":
          "Participated in  hackathon, developing innovative solutions under time constraints.",
      "achievements": [
        "Developed EduSphere platform during hackathon",
        "Won recognition for innovative project ideas",
        "Collaborated with teams",
      ],
      "color": Colors.purple,
      "icon": Icons.emoji_events,
    },
  ];
  // double width = MediaQuery.of(context).size.width;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
        elevation: 0,
        title: Text(
          "Experience",
          style: GoogleFonts.poppins(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.amber,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.amber),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.amber.withOpacity(0.3)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * .90,
                      child: Column(
                        children: [
                          Icon(
                            Icons.business_center,
                            color: Colors.amber,
                            size: 48,
                          ),
                          const SizedBox(height: 12),
                          Text(
                            "Professional Journey",
                            style: GoogleFonts.poppins(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            "Building experience through community and innovation",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Experience Timeline
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: experiences.length,
                itemBuilder: (context, index) {
                  return _buildExperienceCard(
                    experiences[index],
                    index == experiences.length - 1,
                  );
                },
              ),

              const SizedBox(height: 24),

              // Skills Gained Section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.amber.withOpacity(0.3)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.lightbulb, color: Colors.amber, size: 28),
                        const SizedBox(width: 12),
                        Text(
                          "Skills & Learnings",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildSkillChip("Flutter Development"),
                    _buildSkillChip("Firebase Integration"),
                    _buildSkillChip("Team Collaboration"),
                    _buildSkillChip("Mentorship"),
                    _buildSkillChip("Problem Solving"),
                    _buildSkillChip("Project Management"),
                    _buildSkillChip("Public Speaking"),
                    _buildSkillChip("Hackathon Experience"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildExperienceCard(Map<String, dynamic> experience, bool isLast) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  color: experience['color'],
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                ),
              ),
              if (!isLast)
                Container(width: 2, height: 80, color: Colors.grey[700]),
            ],
          ),

          const SizedBox(width: 16),

          // Experience card
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: experience['color'].withOpacity(0.3)),
                boxShadow: [
                  BoxShadow(
                    color: experience['color'].withOpacity(0.1),
                    blurRadius: 8,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: experience['color'].withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          experience['icon'],
                          color: experience['color'],
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              experience['title'],
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              experience['organization'],
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                color: experience['color'],
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 8),

                  // Period
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      experience['period'],
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.white70,
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Description
                  Text(
                    experience['description'],
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white70,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Achievements
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: (experience['achievements'] as List<String>).map((
                      achievement,
                    ) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Icons.check_circle,
                              color: experience['color'],
                              size: 14,
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                achievement,
                                style: GoogleFonts.poppins(
                                  fontSize: 12,
                                  color: Colors.white,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String skill) {
    return Container(
      margin: const EdgeInsets.only(right: 8, bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.amber.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.amber.withOpacity(0.3)),
      ),
      child: Text(
        skill,
        style: GoogleFonts.poppins(
          fontSize: 12,
          color: Colors.amber,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
