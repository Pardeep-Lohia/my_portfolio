import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'about_screen.dart';
import 'skills_screen.dart';
import 'projects_screen.dart';
import 'experience_screen.dart';
import 'achievements_screen.dart';
import 'contact_screen.dart';
import '../data/resume_generator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw "Could not launch \$url";
    }
  }

  @override
  void initState() {
    super.initState();
    _fadeController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_fadeController);
    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  Widget _navigationCard(String title, IconData icon, Widget screen) {
    return Container(
      margin: const EdgeInsets.all(12),
      width: MediaQuery.of(context).size.width - 26,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(0.6),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.amber.withOpacity(0.3),
        highlightColor: Colors.amber.withOpacity(0.1),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48, color: Colors.amber),
              const SizedBox(height: 12),
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopCard(String title, IconData icon, Widget screen) {
    return Container(
      width: 300, // Fixed width for desktop
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.amber.withOpacity(0.6),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        splashColor: Colors.amber.withOpacity(0.3),
        highlightColor: Colors.amber.withOpacity(0.1),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 20,
          ), // Reduced vertical padding
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 40, color: Colors.amber), // Smaller icon
              const SizedBox(height: 8), // Reduced spacing
              Text(
                title,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontSize: 16, // Smaller font
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return FadeTransition(
      opacity: _fadeAnimation,
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.black, Colors.amber],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 40 : 60),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "Hi, I'm",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: isMobile ? 18 : 22,
                      ),
                    ),
                    Text(
                      "Pardeep Lohia",
                      style: GoogleFonts.poppins(
                        color: Colors.white,
                        fontSize: isMobile ? 36 : 46,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      "Flutter Developer | BTech CSE Student | Tech Enthusiast",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: isMobile ? 16 : 18,
                      ),
                    ),
                    const SizedBox(height: 30),
                    Wrap(
                      spacing: 12,
                      children: [
                        ElevatedButton.icon(
                          icon: const Icon(Icons.person),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            foregroundColor: Colors.black,
                            elevation: 4,
                            shadowColor: Colors.black26,
                          ),
                          onPressed: () => _launchURL(
                            "https://www.linkedin.com/in/pardeep-lohia-979a7427a",
                          ),
                          label: const Text("LinkedIn"),
                        ),
                        ElevatedButton.icon(
                          icon: const Icon(Icons.email),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.amber,
                            foregroundColor: Colors.black,
                            elevation: 4,
                            shadowColor: Colors.black26,
                          ),
                          onPressed: () =>
                              _launchURL("mailto:pardeeplohia7098@gmail.com"),
                          label: const Text("Contact Me"),
                        ),
                        Padding(
                          // padding: MediaQuery.of(context).size.width <630 ? const EdgeInsets.all(8.0):const EdgeInsets.all(0),
                          // padding:const EdgeInsets.all(8.0),
                          child: Container(
                            // width: MediaQuery.of(context).size.width <630 ? 260:50,
                            child: ElevatedButton.icon(
                              icon: const Icon(Icons.download),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.amber,
                                foregroundColor: Colors.black,
                                elevation: 4,
                                shadowColor: Colors.black26,
                              ),
                              onPressed: () async {
                                print("Download Resume button tapped");
                                showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: (context) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                                );
                                try {
                                  await ResumeGenerator.generateAndDownloadResume();
                                } catch (e) {
                                  print("Error during resume generation: \$e");
                                  // Optionally handle error here, e.g. show snackbar
                                } finally {
                                  Navigator.of(context).pop(); // Close loading dialog
                                }
                              },
                              label: const Text("Download Resume"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.black,
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Text(
                    "Explore My Portfolio",
                    style: GoogleFonts.poppins(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                  const SizedBox(height: 20),
                  LayoutBuilder(
                    builder: (context, constraints) {
                      final screenWidth = MediaQuery.of(context).size.width;
                      final isMobile = screenWidth < 600;
                      final isTablet = screenWidth >= 600 && screenWidth < 900;
                      final isDesktop = screenWidth >= 900;

                      if (isDesktop) {
                        // Desktop: Single column layout with reduced height
                        return GridView.count(
                          shrinkWrap: true, // so it won’t take infinite height
                          physics:
                              const NeverScrollableScrollPhysics(), // disable inner scroll if inside SingleChildScrollView
                          crossAxisCount: 3, // 3 items per row
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 16,
                          childAspectRatio:
                              1.2, // adjust width/height ratio of each item
                          children:
                              [
                                _buildDesktopCard(
                                  "About",
                                  Icons.person_outline,
                                  const AboutScreen(),
                                ),
                                _buildDesktopCard(
                                  "Skills",
                                  Icons.code,
                                  const SkillsScreen(),
                                ),
                                _buildDesktopCard(
                                  "Projects",
                                  Icons.work,
                                  const ProjectsScreen(),
                                ),
                                _buildDesktopCard(
                                  "Experience",
                                  Icons.business_center,
                                  const ExperienceScreen(),
                                ),
                                _buildDesktopCard(
                                  "Achievements",
                                  Icons.star,
                                  AchievementsScreen(),
                                ),
                                _buildDesktopCard(
                                  "Contact",
                                  Icons.contact_mail,
                                  const ContactScreen(),
                                ),
                              ].map((card) {
                                return Container(
                                  width: MediaQuery.of(context).size.width - 26,
                                  child: card,
                                );
                              }).toList(),
                        );
                      } else if (isTablet) {
                        // Tablet: 2 columns grid
                        return GridView.count(
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          mainAxisSpacing: 24,
                          crossAxisSpacing: 24,
                          childAspectRatio: 1.3,
                          children: [
                            _navigationCard(
                              "About",
                              Icons.person_outline,
                              const AboutScreen(),
                            ),
                            _navigationCard(
                              "Skills",
                              Icons.code,
                              const SkillsScreen(),
                            ),
                            _navigationCard(
                              "Projects",
                              Icons.work,
                              const ProjectsScreen(),
                            ),
                            _navigationCard(
                              "Experience",
                              Icons.business_center,
                              const ExperienceScreen(),
                            ),
                            _navigationCard(
                              "Achievements",
                              Icons.star,
                              AchievementsScreen(),
                            ),
                            _navigationCard(
                              "Contact",
                              Icons.contact_mail,
                              const ContactScreen(),
                            ),
                          ],
                        );
                      } else {
                        // Mobile: Single column
                        return Column(
                          children: [
                            _navigationCard(
                              "About",
                              Icons.person_outline,
                              const AboutScreen(),
                            ),
                            const SizedBox(height: 16),
                            _navigationCard(
                              "Skills",
                              Icons.code,
                              const SkillsScreen(),
                            ),
                            const SizedBox(height: 16),
                            _navigationCard(
                              "Projects",
                              Icons.work,
                              const ProjectsScreen(),
                            ),
                            const SizedBox(height: 16),
                            _navigationCard(
                              "Experience",
                              Icons.business_center,
                              const ExperienceScreen(),
                            ),
                            const SizedBox(height: 16),
                            _navigationCard(
                              "Achievements",
                              Icons.star,
                              AchievementsScreen(),
                            ),
                            const SizedBox(height: 16),
                            _navigationCard(
                              "Contact",
                              Icons.contact_mail,
                              const ContactScreen(),
                            ),
                          ],
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
