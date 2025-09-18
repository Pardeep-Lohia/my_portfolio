import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

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
          "About Me",
          style: GoogleFonts.poppins(
            fontSize: isMobile
                ? 20
                : isTablet
                ? 24
                : 28,
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
          padding: EdgeInsets.all(
            isMobile
                ? 16
                : isTablet
                ? 24
                : 32,
          ),
          child: Column(
            children: [
              // Profile Picture Section
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
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: isMobile
                          ? 50
                          : isTablet
                          ? 60
                          : 70,
                      backgroundImage: const AssetImage('assets/Pardeep_Lohia.jpeg'),
                      backgroundColor: Colors.amber,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "Pardeep Lohia",
                      style: GoogleFonts.poppins(
                        fontSize: isMobile
                            ? 24
                            : isTablet
                            ? 28
                            : 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Flutter Developer & Tech Enthusiast",
                      style: GoogleFonts.poppins(
                        fontSize: isMobile
                            ? 14
                            : isTablet
                            ? 16
                            : 18,
                        color: Colors.amber,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Education Section
              _buildInfoCard(
                icon: Icons.school,
                title: "Education",
                content:
                    "4th Year BTech Computer Science\nPunjabi University, Patiala\nCGPA: 7.4(till 5th semester)",
                color: Colors.blue,
              ),

              const SizedBox(height: 16),

              // Experience Section
              _buildInfoCard(
                icon: Icons.business_center,
                title: "Experience",
                content:
                    "Core Member & Flutter Developer and Mentor\nGDC onCampus Punjabi University\nSep 2024 - May-2025",
                color: Colors.green,
              ),

              const SizedBox(height: 16),

              // Skills Overview
              _buildInfoCard(
                icon: Icons.code,
                title: "Technical Expertise",
                content:
                    "Flutter, Firebase, Java, Python, MySQL\nDSA\nProblem Solving & OOP",
                color: Colors.purple,
              ),

              const SizedBox(height: 16),

              // Achievements
              _buildInfoCard(
                icon: Icons.star,
                title: "Key Achievements",
                content:
                    "Flutter Workshop Mentor\nHackathon Participant\nLOR from GDSC\nMultiple Certifications",
                color: Colors.orange,
              ),

              const SizedBox(height: 24),

              // Bio Section
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
                        Icon(
                          Icons.person_outline,
                          color: Colors.amber,
                          size: 28,
                        ),
                        const SizedBox(width: 12),
                        Text(
                          "About Me",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Text(
                      "I am a passionate Flutter developer with strong experience in mobile app development. "
                      "As a core member of GDGonCampus Punjabi University, I actively contribute to the tech community "
                      "by mentoring Flutter workshops and participating in hackathons. My expertise spans across "
                      "Flutter, Firebase, Java, MySQL, with a focus on creating innovative "
                      "solutions and problem-solving.",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white70,
                        height: 1.6,
                      ),
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard({
    required IconData icon,
    required String title,
    required String content,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  content,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white70,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
