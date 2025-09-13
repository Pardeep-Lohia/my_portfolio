import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

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
          "Get In Touch",
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
              // Container(
              //   padding: const EdgeInsets.all(20),
              //   decoration: BoxDecoration(
              //     color: Colors.grey[900],
              //     borderRadius: BorderRadius.circular(20),
              //     border: Border.all(color: Colors.amber.withOpacity(0.3)),
              //   ),
              //   child: Column(
              //     children: [
              //       Icon(Icons.contact_mail, color: Colors.amber, size: 48),
              //       const SizedBox(height: 12),
              //       Text(
              //         "Let's Connect",
              //         style: GoogleFonts.poppins(
              //           fontSize: 24,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.white,
              //         ),
              //       ),
              //       const SizedBox(height: 8),
              //       Text(
              //         "I'm always open to discussing new opportunities and collaborations",
              //         style: GoogleFonts.poppins(
              //           fontSize: 14,
              //           color: Colors.white70,
              //           height: 1.5,
              //         ),
              //         textAlign: TextAlign.center,
              //       ),
              //     ],
              //   ),
              // ),
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
                        "Let's Connect",
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
                        "I'm always open to discussing new opportunities and collaborations",
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

              const SizedBox(height: 24),

              // Contact Information Cards
              _buildContactCard(
                icon: Icons.email,
                title: "Email",
                value: "pardeeplohia7098@gmail.com",
                color: Colors.red,
                onTap: () => _launchURL("mailto:pardeeplohia7098@gmail.com"),
              ),

              const SizedBox(height: 16),

              _buildContactCard(
                icon: Icons.phone,
                title: "Phone",
                value: "+91 9781864212",
                color: Colors.green,
                onTap: () => _launchURL("tel:+919781864212"),
              ),

              const SizedBox(height: 16),

              _buildContactCard(
                icon: Icons.location_on,
                title: "Location",
                value: "Patiala, Punjab, India",
                color: Colors.blue,
                onTap: () => _launchURL(
                  "https://maps.google.com/?q=Patiala,Punjab,India",
                ),
              ),

              const SizedBox(height: 24),

              // Social Media Section
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
                        Icon(Icons.share, color: Colors.amber, size: 28),
                        const SizedBox(width: 12),
                        Text(
                          "Social Media",
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
                      "Connect with me on professional platforms",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Social Media Buttons
                    Row(
                      children: [
                        Expanded(
                          child: _buildSocialButton(
                            icon: Icons.business,
                            label: "LinkedIn",
                            color: Colors.blue,
                            onTap: () => _launchURL(
                              "https://www.linkedin.com/in/pardeep-lohia-979a7427a",
                            ),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildSocialButton(
                            icon: Icons.code,
                            label: "GitHub",
                            color: Colors.grey,
                            onTap: () =>
                                _launchURL("https://github.com/pardeep-lohia"),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Row(
                      children: [
                        Expanded(
                          child: _buildSocialButton(
                            icon: Icons.message,
                            label: "WhatsApp",
                            color: Colors.green,
                            onTap: () =>
                                _launchURL("https://wa.me/919781864212"),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _buildSocialButton(
                            icon: Icons.telegram,
                            label: "Telegram",
                            color: Colors.blue,
                            onTap: () =>
                                _launchURL("https://t.me/pardeep_lohia"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Availability Section
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
                        Icon(Icons.access_time, color: Colors.amber, size: 28),
                        const SizedBox(width: 12),
                        Text(
                          "Availability",
                          style: GoogleFonts.poppins(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    _buildAvailabilityItem(
                      "Open to Work",
                      "Actively seeking Flutter development opportunities",
                      Colors.green,
                    ),
                    _buildAvailabilityItem(
                      "Remote Work",
                      "Available for remote and hybrid work arrangements",
                      Colors.blue,
                    ),
                    _buildAvailabilityItem(
                      "Freelance Projects",
                      "Accepting freelance Flutter and mobile app projects",
                      Colors.purple,
                    ),
                    _buildAvailabilityItem(
                      "Mentorship",
                      "Available for Flutter development mentoring sessions",
                      Colors.orange,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Call to Action
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.amber.withOpacity(0.2),
                      Colors.amber.withOpacity(0.1),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.amber.withOpacity(0.3)),
                ),
                child: Column(
                  children: [
                    Icon(Icons.send, color: Colors.amber, size: 48),
                    const SizedBox(height: 12),
                    Text(
                      "Ready to Start a Conversation?",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "Feel free to reach out for collaborations, opportunities, or just to say hello!",
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white70,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton.icon(
                      onPressed: () =>
                          _launchURL("mailto:pardeeplohia7098@gmail.com"),
                      icon: const Icon(Icons.email),
                      label: Text(
                        "Send Email",
                        style: GoogleFonts.poppins(fontSize: 16),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.amber,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
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

  Widget _buildContactCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
    required VoidCallback onTap,
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
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(16),
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
                    value,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: color, size: 16),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialButton({
    required IconData icon,
    required String label,
    required Color color,
    required VoidCallback onTap,
  }) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(label, style: GoogleFonts.poppins(fontSize: 14)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.symmetric(vertical: 12),
      ),
    );
  }

  Widget _buildAvailabilityItem(String title, String description, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Container(
            width: 12,
            height: 12,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white70,
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
