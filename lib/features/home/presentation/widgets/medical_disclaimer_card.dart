import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injurysnap/core/constants/app_colors.dart';

class MedicalDisclaimerCard extends StatelessWidget {
  const MedicalDisclaimerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF9FAFB),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(
            FontAwesomeIcons.circleInfo, // or solid circle info
            size: 20,
            color: AppColors.textLight.withOpacity(0.8),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: GoogleFonts.outfit(
                  fontSize: 12,
                  color: AppColors.textDark,
                  height: 1.5,
                ),
                children: [
                  TextSpan(
                    text: 'Medical Disclaimer: ',
                    style: GoogleFonts.outfit(fontWeight: FontWeight.w700),
                  ),
                  const TextSpan(
                    text:
                        'InjurySnap provides preliminary assessments only and is not a substitute for professional medical advice. Always consult a healthcare provider for serious injuries.',
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
