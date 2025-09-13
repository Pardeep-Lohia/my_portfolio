import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import '../data/projects_data.dart';

class ProjectsScreen extends StatelessWidget {
  const ProjectsScreen({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "Could not launch \$url";
    }
  }

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
          "My Projects",
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 20 : isTablet ? 24 : 28,
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
          padding: EdgeInsets.all(isMobile ? 16 : isTablet ? 24 : 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Container(
                padding: EdgeInsets.all(isMobile ? 16 : isTablet ? 20 : 24),
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.amber.withOpacity(0.3)),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width * .95,
                  child: Column(
                    children: [
                      Icon(Icons.work, color: Colors.amber, size: isMobile ? 40 : isTablet ? 48 : 56),
                      const SizedBox(height: 12),
                      Text(
                        "Featured Projects",
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 20 : isTablet ? 24 : 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Showcasing my journey in software development",
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 12 : isTablet ? 14 : 16,
                          color: Colors.white70,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 24),

              // Projects Grid
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 1 : isTablet ? 2 : 3,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  childAspectRatio: isMobile ? 1.2 : isTablet ? 1.1 : 1.0,
                ),
                itemCount: ProjectData.projects.length,
                itemBuilder: (context, index) {
                  return _buildProjectCard(ProjectData.projects[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProjectCard(Map<String, dynamic> project) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: project['color'].withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: project['color'].withOpacity(0.1),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with icon and status
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: project['color'].withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    project['icon'],
                    color: project['color'],
                    size: 24,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        project['title'],
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                        decoration: BoxDecoration(
                          color: project['color'].withOpacity(0.2),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          project['status'],
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            color: project['color'],
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
            Expanded(
              child: Text(
                project['description'],
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  color: Colors.white70,
                  height: 1.5,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Tech Stack
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: (project['tech'] as List<String>).map((tech) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tech,
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

            // Action Buttons
            Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () => _launchURL(project['github']),
                    icon: const Icon(Icons.code, size: 16),
                    label: Text(
                      "GitHub",
                      style: GoogleFonts.poppins(fontSize: 12),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: project['color'],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () => _launchURL(project['deployed']),
                    icon: const Icon(Icons.launch, size: 16),
                    label: Text(
                      "Live Demo",
                      style: GoogleFonts.poppins(fontSize: 12),
                    ),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: project['color'],
                      side: BorderSide(color: project['color']),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 8),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
