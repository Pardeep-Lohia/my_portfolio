import 'dart:typed_data';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:universal_html/html.dart' as html;

class ResumeGenerator {
  static Future<void> generateAndDownloadResume() async {
    try {
      final pdf = pw.Document();

      pdf.addPage(
        pw.MultiPage(
          pageFormat: PdfPageFormat.a4,
          build: (pw.Context context) {
            return [
              // Header - Name and Contact
              pw.Container(
                padding: const pw.EdgeInsets.only(bottom: 10),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'Pardeep Lohia',
                      style: pw.TextStyle(
                        fontSize: 24,
                        fontWeight: pw.FontWeight.bold,
                        font: pw.Font.helveticaBold(),
                      ),
                    ),
                    pw.Text(
                      'Flutter Developer | BTech CSE Student | Tech Enthusiast',
                      style: pw.TextStyle(
                        fontSize: 12,
                        font: pw.Font.helvetica(),
                      ),
                    ),
                    pw.SizedBox(height: 5),
                    pw.Text(
                      'Email: pardeeplohia7098@gmail.com | LinkedIn: linkedin.com/in/pardeep-lohia-979a7427a',
                      style: pw.TextStyle(
                        fontSize: 10,
                        font: pw.Font.helvetica(),
                      ),
                    ),
                  ],
                ),
              ),

              // Summary
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(vertical: 10),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'PROFESSIONAL SUMMARY',
                      style: pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                        font: pw.Font.helveticaBold(),
                      ),
                    ),
                    pw.Divider(),
                    pw.Text(
                      'Passionate Flutter developer with strong experience in mobile app development. Core member of GDSC Punjabi University, actively contributing to the tech community through Flutter development and mentorship. Expertise spans Flutter, Firebase, Java, MySQL, with a focus on creating innovative solutions and problem-solving.',
                      style: pw.TextStyle(
                        fontSize: 10,
                        font: pw.Font.helvetica(),
                        lineSpacing: 2,
                      ),
                    ),
                  ],
                ),
              ),

              // Experience
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(vertical: 10),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'PROFESSIONAL EXPERIENCE',
                      style: pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                        font: pw.Font.helveticaBold(),
                      ),
                    ),
                    pw.Divider(),
                    _buildExperienceItem(
                      'Core Member & Flutter Developer and Mentor',
                      'GDSC Punjabi University',
                      'Sep 2024 - May 2025',
                      'Active member contributing to tech community through Flutter development and mentorship. Conducted Flutter workshop as mentor, built cross-platform applications, collaborated on Firebase-integrated projects, participated in hackathons.',
                    ),
                    _buildExperienceItem(
                      'Flutter Workshop Mentor',
                      'GDSC Punjabi University',
                      'Nov 2024',
                      'Led interactive workshop sessions teaching Flutter development fundamentals. Prepared materials, demonstrated app development, mentored students, received positive feedback.',
                    ),
                    _buildExperienceItem(
                      'Hackathon Participant',
                      'Various Events',
                      'Feb 2025',
                      'Participated in hackathons developing innovative solutions. Developed EduSphere platform, won recognition, collaborated with teams.',
                    ),
                    _buildExperienceItem(
                      '6-weeks Training',
                      'Future Finders',
                      'June 2024 - July 2024',
                      'Completed training in Python and Machine Learning basics. Built minor projects.',
                    ),
                  ],
                ),
              ),

              // Education
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(vertical: 10),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'EDUCATION',
                      style: pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                        font: pw.Font.helveticaBold(),
                      ),
                    ),
                    pw.Divider(),
                    _buildEducationItem(
                      'Bachelor of Technology in Computer Science Engineering',
                      'Punjabi University, Patiala',
                      '2022 - 2026',
                      'CGPA: 7.4 (till 5th semester)',
                    ),
                  ],
                ),
              ),

              // Skills
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(vertical: 10),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'TECHNICAL SKILLS',
                      style: pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                        font: pw.Font.helveticaBold(),
                      ),
                    ),
                    pw.Divider(),
                    pw.Text(
                      'Programming Languages: Dart (90%), Java (75%), Python (70%), C (65%)',
                      style: pw.TextStyle(fontSize: 10, font: pw.Font.helvetica()),
                    ),
                    pw.Text(
                      'Frameworks & Tools: Flutter (90%), Firebase (80%), MySQL (75%)',
                      style: pw.TextStyle(fontSize: 10, font: pw.Font.helvetica()),
                    ),
                    pw.Text(
                      'Core Concepts: DSA (80%), OOP (75%), Problem-Solving (80%)',
                      style: pw.TextStyle(fontSize: 10, font: pw.Font.helvetica()),
                    ),
                  ],
                ),
              ),

              // Projects
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(vertical: 10),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'KEY PROJECTS',
                      style: pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                        font: pw.Font.helveticaBold(),
                      ),
                    ),
                    pw.Divider(),
                    _buildProjectItem(
                      'EduSphere',
                      'EdTech platform for collaborative learning during hackathon. Winner of BharatTech 2.0.',
                      'Flutter, Firebase',
                    ),
                    _buildProjectItem(
                      'EnggiQuest',
                      'Quiz app for GATE preparation with branch-specific modes, query search using Gemini API, Firebase backend.',
                      'Flutter, Firebase, Gemini API',
                    ),
                  ],
                ),
              ),

              // Achievements
              pw.Container(
                padding: const pw.EdgeInsets.symmetric(vertical: 10),
                child: pw.Column(
                  crossAxisAlignment: pw.CrossAxisAlignment.start,
                  children: [
                    pw.Text(
                      'ACHIEVEMENTS',
                      style: pw.TextStyle(
                        fontSize: 14,
                        fontWeight: pw.FontWeight.bold,
                        font: pw.Font.helveticaBold(),
                      ),
                    ),
                    pw.Divider(),
                    pw.Bullet(
                      text: 'Secured Title (Best Use of Gemini API) in BharatTech 2.0 Hackathon - EduSphere (Feb 2025)',
                      style: pw.TextStyle(fontSize: 10, font: pw.Font.helvetica()),
                    ),
                    pw.Bullet(
                      text: 'Hack-N-Win Hackathon Participation and Get Recognition (March 2025)',
                      style: pw.TextStyle(fontSize: 10, font: pw.Font.helvetica()),
                    ),
                    pw.Bullet(
                      text: 'Letter of Recommendation from GDSC Punjabi University (2024)',
                      style: pw.TextStyle(fontSize: 10, font: pw.Font.helvetica()),
                    ),
                    pw.Bullet(
                      text: 'Active GDSC Contributor and Mentor',
                      style: pw.TextStyle(fontSize: 10, font: pw.Font.helvetica()),
                    ),
                  ],
                ),
              ),
            ];
          },
        ),
      );

      final bytes = await pdf.save();
      final blob = html.Blob([bytes], 'application/pdf');
      final url = html.Url.createObjectUrlFromBlob(blob);
      final anchor = html.document.createElement('a') as html.AnchorElement
        ..href = url
        ..style.display = 'none'
        ..download = 'Pardeep_Lohia_Resume.pdf';
      html.document.body!.append(anchor);
      anchor.click();
      anchor.remove();
      html.Url.revokeObjectUrl(url);
    } catch (e) {
      print('Error generating or sharing resume: \$e');
      rethrow;
    }
  }

  static pw.Widget _buildExperienceItem(String title, String organization, String period, String description) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 10),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Row(
            mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
            children: [
              pw.Text(
                title,
                style: pw.TextStyle(
                  fontSize: 12,
                  fontWeight: pw.FontWeight.bold,
                  font: pw.Font.helveticaBold(),
                ),
              ),
              pw.Text(
                period,
                style: pw.TextStyle(fontSize: 10, font: pw.Font.helvetica()),
              ),
            ],
          ),
          pw.Text(
            organization,
            style: pw.TextStyle(
              fontSize: 11,
              font: pw.Font.helvetica(),
              color: PdfColors.grey700,
            ),
          ),
          pw.SizedBox(height: 3),
          pw.Text(
            description,
            style: pw.TextStyle(fontSize: 10, font: pw.Font.helvetica()),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildEducationItem(String degree, String institution, String period, String details) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 10),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            degree,
            style: pw.TextStyle(
              fontSize: 12,
              fontWeight: pw.FontWeight.bold,
              font: pw.Font.helveticaBold(),
            ),
          ),
          pw.Text(
            institution,
            style: pw.TextStyle(
              fontSize: 11,
              font: pw.Font.helvetica(),
              color: PdfColors.grey700,
            ),
          ),
          pw.Text(
            '$period | $details',
            style: pw.TextStyle(fontSize: 10, font: pw.Font.helvetica()),
          ),
        ],
      ),
    );
  }

  static pw.Widget _buildProjectItem(String title, String description, String tech) {
    return pw.Container(
      margin: const pw.EdgeInsets.only(bottom: 10),
      child: pw.Column(
        crossAxisAlignment: pw.CrossAxisAlignment.start,
        children: [
          pw.Text(
            title,
            style: pw.TextStyle(
              fontSize: 12,
              fontWeight: pw.FontWeight.bold,
              font: pw.Font.helveticaBold(),
            ),
          ),
          pw.Text(
            description,
            style: pw.TextStyle(fontSize: 10, font: pw.Font.helvetica()),
          ),
          pw.Text(
            'Technologies: $tech',
            style: pw.TextStyle(
              fontSize: 9,
              font: pw.Font.helvetica(),
              color: PdfColors.grey700,
            ),
          ),
        ],
      ),
    );
  }
}
