import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AchievementsScreen extends StatelessWidget {
  AchievementsScreen({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "Could not launch \$url";
    }
  }

  final List<Map<String, dynamic>> achievements = [
    {
      "title": "Secured Title(Best Use of Gemini API) in BharatTech 2.0 Hackathon  - EduSphere",
      "description":
          "Developed EduSphere, an EdTech platform for collaborative learning during a hackathon and secured unique title.",
      "date": "08-feb-2025",
      "type": "Hackathone",
      "proof": "https://drive.google.com/file/d/1L8QDbVS_uVTeTDS0QTfS-xrulSGajtL0/view?usp=drive_link",
      "color": Colors.yellow,
      "icon": Icons.emoji_events,
      "tags": ["Secured Title", "EdTech", "Innovation"],
    },
    {
      "title": "Hack-N-Win Hackathone",
      "description":
          "Participated in Hack-N-Win Hackathone and Secured Title",
      "date": "1-March-2025",
      "type": "Certification",
      "proof": "https://drive.google.com/file/d/103955pkOmSD8flFLQ2Kj8IKHLsIil5FI/view?usp=drive_link",
      "color": Colors.blue,
      "icon": Icons.code,
      "tags": ["Flutter", "Mobile Dev", "Certification"],
    },
    // {
    //   "title": "GenAI Apps with Gemini Certification",
    //   "description":
    //       "Certified in building Generative AI applications using Google's Gemini AI platform.",
    //   "date": "2024",
    //   "type": "Certification",
    //   "proof": "Assets/demouse.jpg",
    //   "color": Colors.purple,
    //   "icon": Icons.smart_toy,
    //   "tags": ["AI", "Gemini", "GenAI"],
    // },
    // {
    //   "title": "Prompt Design in Vertex AI Certification",
    //   "description":
    //       "Mastered prompt engineering and design principles for Vertex AI platform.",
    //   "date": "2024",
    //   "type": "Certification",
    //   "proof": "Assets/demouse.jpg",
    //   "color": Colors.green,
    //   "icon": Icons.psychology,
    //   "tags": ["AI", "Vertex AI", "Prompt Engineering"],
    // },
    {
      "title": "LOR from GDSC Punjabi University",
      "description":
          "Received Letter of Recommendation from GDSC Punjabi University for outstanding contributions.",
      "date": "2024",
      "type": "Recognition",
      "proof": "https://drive.google.com/file/d/1IqXKG9TiwiWwdE4JSRpUFvqzspPjjoa2/view?usp=drive_link",
      "color": Colors.orange,
      "icon": Icons.verified,
      "tags": ["GDSC", "Recognition"],
    },
    {
      "title": "Active GDSC Contributor",
      "description":
          "Consistent contributor to GDSC projects, events, and community initiatives at Punjabi University.",
      "date": "2024 - Present",
      "type": "Community",
      "proof": "https://www.linkedin.com/in/pardeep-lohia-979a7427a",
      "color": Colors.red,
      "icon": Icons.group_work,
      "tags": ["Community", "Leadership", "Events"],
    },
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;
    final isTablet = screenWidth >= 600 && screenWidth < 1200;
    final isDesktop = screenWidth >= 1200;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.amber,
        elevation: 0,
        title: Text(
          "Achievements",
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
                padding: EdgeInsets.all(
                  isMobile
                      ? 16
                      : isTablet
                      ? 20
                      : 24,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.amber.withOpacity(0.3)),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * .95,
                  child: Column(
                    children: [
                      Icon(
                        Icons.work,
                        color: Colors.amber,
                        size: isMobile
                            ? 40
                            : isTablet
                            ? 48
                            : 56,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "Milestones & Recognition",
                        style: GoogleFonts.poppins(
                          fontSize: isMobile
                              ? 20
                              : isTablet
                              ? 24
                              : 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Celebrating achievements and continuous growth",
                        style: GoogleFonts.poppins(
                          fontSize: isMobile
                              ? 12
                              : isTablet
                              ? 14
                              : 16,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              // Container(
              //   padding: const EdgeInsets.all(20),
              //   decoration: BoxDecoration(
              //     color: Colors.grey[900],
              //     borderRadius: BorderRadius.circular(20),
              //     border: Border.all(color: Colors.amber.withOpacity(0.3)),
              //   ),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * .95,
              //     child: Column(
              //       children: [
              //         Icon(Icons.star, color: Colors.amber, size: 48),
              //         const SizedBox(height: 12),
              //         Text(
              //           "Milestones & Recognition",
              //           style: GoogleFonts.poppins(
              //             fontSize: 24,
              //             fontWeight: FontWeight.bold,
              //             color: Colors.white,
              //           ),
              //         ),
              //         const SizedBox(height: 8),
              //         Text(
              //           "Celebrating achievements and continuous growth",
              //           style: GoogleFonts.poppins(
              //             fontSize: 14,
              //             color: Colors.white70,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              const SizedBox(height: 24),

              // Achievement Stats
              Row(
                children: [
                  _buildStatCard("Certifications", "4", Colors.blue),
                  const SizedBox(width: 12),
                  _buildStatCard("Hackathons", "2", Colors.green),
                  const SizedBox(width: 12),
                  _buildStatCard("Awards", "1", Colors.yellow),
                ],
              ),

              const SizedBox(height: 24),

              // Achievements Grid
              LayoutBuilder(
                builder: (context, constraints) {
                  // Responsive grid: 1 column for mobile, 2 for tablet, 3 for desktop
                  int crossAxisCount;
                  double childAspectRatio;

                  if (constraints.maxWidth >= 1200) {
                    // Desktop
                    crossAxisCount = 3;
                    childAspectRatio = 1.2;
                  } else if (constraints.maxWidth >= 800) {
                    // Tablet
                    crossAxisCount = 2;
                    childAspectRatio = 1.1;
                  } else {
                    // Mobile
                    crossAxisCount = 1;
                    childAspectRatio = 1.0;
                  }

                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: childAspectRatio,
                    ),
                    itemCount: achievements.length,
                    itemBuilder: (context, index) {
                      return _buildAchievementCard(achievements[index]);
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Text(
              value,
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: GoogleFonts.poppins(fontSize: 12, color: Colors.white70),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAchievementCard(Map<String, dynamic> achievement) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 300;
        return Container(
          padding: const EdgeInsets.all(20),
          height: isDesktop
              ? 160
              : null, // Reduced height for desktop, auto for others
          decoration: BoxDecoration(
            color: Colors.grey[900],
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: achievement['color'].withOpacity(0.3)),
            boxShadow: [
              BoxShadow(
                color: achievement['color'].withOpacity(0.1),
                blurRadius: 12,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with icon and type
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: achievement['color'].withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(
                      achievement['icon'],
                      color: achievement['color'],
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          achievement['title'],
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: achievement['color'].withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            achievement['type'],
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              color: achievement['color'],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Description
              Flexible(
                child: Text(
                  achievement['description'],
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white70,
                    height: 1.5,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Tags
              Wrap(
                spacing: 6,
                runSpacing: 6,
                children: (achievement['tags'] as List<String>).map((tag) {
                  return Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[800],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      tag,
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }).toList(),
              ),

              const SizedBox(height: 16),

              // Date and Proof button
              Row(
                children: [
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
                      achievement['date'],
                      style: GoogleFonts.poppins(
                        fontSize: 10,
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton.icon(
                    onPressed: () => _launchURL(achievement['proof']),
                    icon: const Icon(Icons.verified, size: 14),
                    label: Text(
                      "Verify",
                      style: GoogleFonts.poppins(fontSize: 12),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: achievement['color'],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
