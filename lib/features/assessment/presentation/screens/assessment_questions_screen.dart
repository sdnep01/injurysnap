import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injurysnap/core/constants/app_colors.dart';
import 'package:injurysnap/features/assessment/presentation/screens/analyzing_screen.dart';

class AssessmentQuestionsScreen extends StatefulWidget {
  const AssessmentQuestionsScreen({super.key});

  @override
  State<AssessmentQuestionsScreen> createState() =>
      _AssessmentQuestionsScreenState();
}

class _AssessmentQuestionsScreenState extends State<AssessmentQuestionsScreen> {
  String? selectedBodyPart;
  String? selectedPainType;
  double painIntensity = 5.0;

  final List<Map<String, dynamic>> bodyParts = [
    {'name': 'Head/Neck', 'icon': FontAwesomeIcons.headSideVirus}, // Generic
    {'name': 'Shoulder', 'icon': FontAwesomeIcons.childReaching},
    {'name': 'Arm/Elbow', 'icon': FontAwesomeIcons.handBackFist},
    {'name': 'Wrist/Hand', 'icon': FontAwesomeIcons.hand},
    {'name': 'Back/Spine', 'icon': FontAwesomeIcons.person}, // Generic
    {'name': 'Chest/Ribs', 'icon': FontAwesomeIcons.lungs},
    {'name': 'Hips/Groin', 'icon': FontAwesomeIcons.person}, // Generic
    {'name': 'Thigh Area', 'icon': FontAwesomeIcons.personWalking},
    {'name': 'Knee Area', 'icon': FontAwesomeIcons.bone},
    {'name': 'Ankle/Foot', 'icon': FontAwesomeIcons.shoePrints},
  ];

  final List<Map<String, dynamic>> painTypes = [
    {'name': 'Sharp', 'icon': FontAwesomeIcons.bolt},
    {'name': 'Throbbing', 'icon': FontAwesomeIcons.heartPulse},
    {'name': 'Stiff/Dull', 'icon': FontAwesomeIcons.lock},
    {'name': 'Tingling', 'icon': FontAwesomeIcons.bacterium}, // Approx
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'New Injury',
          style: GoogleFonts.outfit(
            color: AppColors.textDark,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(
              FontAwesomeIcons.circleQuestion,
              color: AppColors.textDark,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSectionTitle(
                    'Where is your injury?',
                    'Select the affected body part',
                  ),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 3,
                        ),
                    itemCount: bodyParts.length,
                    itemBuilder: (context, index) {
                      final part = bodyParts[index];
                      final isSelected = selectedBodyPart == part['name'];
                      return GestureDetector(
                        onTap: () =>
                            setState(() => selectedBodyPart = part['name']),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary
                                : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primary
                                  : Colors.grey.withOpacity(0.1),
                            ),
                            boxShadow: [
                              if (!isSelected)
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.02),
                                  blurRadius: 4,
                                  offset: const Offset(0, 2),
                                ),
                            ],
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              Icon(
                                part['icon'],
                                size: 18,
                                color: isSelected
                                    ? Colors.white
                                    : AppColors.textLight,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                part['name'],
                                style: GoogleFonts.outfit(
                                  fontSize: 13,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  color: isSelected
                                      ? Colors.white
                                      : AppColors.textDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 32),
                  _buildSectionTitle('Select a type of pain', ''),
                  const SizedBox(height: 16),
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 3,
                        ),
                    itemCount: painTypes.length,
                    itemBuilder: (context, index) {
                      final type = painTypes[index];
                      final isSelected = selectedPainType == type['name'];
                      return GestureDetector(
                        onTap: () =>
                            setState(() => selectedPainType = type['name']),
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Colors.amber
                                : Colors
                                      .white, // Using amber/orange from design for selection
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(
                              color: isSelected
                                  ? Colors.amber
                                  : Colors.grey.withOpacity(0.1),
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              Icon(
                                type['icon'],
                                size: 18,
                                color: isSelected ? Colors.white : Colors.amber,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                type['name'],
                                style: GoogleFonts.outfit(
                                  fontSize: 13,
                                  fontWeight: isSelected
                                      ? FontWeight.w600
                                      : FontWeight.w400,
                                  color: isSelected
                                      ? Colors.white
                                      : AppColors.textDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),

                  const SizedBox(height: 32),
                  _buildSectionTitle(
                    'Your Pain Intensity Level',
                    'Rate from 1 (mild) to 10 (severe)',
                  ),
                  const SizedBox(height: 24),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Mild",
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              color: AppColors.textLight,
                            ),
                          ),
                          Text(
                            "Moderate",
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              color: AppColors.textLight,
                            ),
                          ),
                          Text(
                            "Severe",
                            style: GoogleFonts.outfit(
                              fontSize: 12,
                              color: AppColors.textLight,
                            ),
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.orange,
                          inactiveTrackColor: Colors.orange.withOpacity(0.2),
                          thumbColor: Colors.orange,
                          trackHeight: 4,
                        ),
                        child: Slider(
                          value: painIntensity,
                          min: 1,
                          max: 10,
                          divisions: 9,
                          label: painIntensity.round().toString(),
                          onChanged: (val) =>
                              setState(() => painIntensity = val),
                        ),
                      ),
                      Text(
                        painIntensity.round().toString(),
                        style: GoogleFonts.outfit(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      Text(
                        "Current pain level",
                        style: GoogleFonts.outfit(
                          fontSize: 12,
                          color: AppColors.textLight,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),

          // Footer Buttons
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  offset: Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Back',
                      style: GoogleFonts.outfit(color: AppColors.textDark),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const AnalyzingScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: Text(
                      'Continue',
                      style: GoogleFonts.outfit(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, String subtitle) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: GoogleFonts.outfit(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textDark,
          ),
        ),
        if (subtitle.isNotEmpty) ...[
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: GoogleFonts.outfit(fontSize: 12, color: AppColors.textLight),
          ),
        ],
      ],
    );
  }
}
