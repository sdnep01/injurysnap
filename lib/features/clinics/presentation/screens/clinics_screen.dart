import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:injurysnap/core/constants/app_colors.dart';

class ClinicsScreen extends StatefulWidget {
  const ClinicsScreen({super.key});

  @override
  State<ClinicsScreen> createState() => _ClinicsScreenState();
}

class _ClinicsScreenState extends State<ClinicsScreen> {
  bool isMapView = true;
  String selectedFilter = 'Map';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: AppColors.textDark),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Nearby Clinics',
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
              FontAwesomeIcons.sliders,
              color: AppColors.textDark,
              size: 18,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          // Location Header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            child: Row(
              children: [
                Icon(
                  FontAwesomeIcons.locationCrosshairs,
                  size: 16,
                  color: AppColors.primary,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your Location',
                        style: GoogleFonts.outfit(
                          fontSize: 12,
                          color: AppColors.textLight,
                        ),
                      ),
                      Text(
                        '123 Street, London, UK',
                        style: GoogleFonts.outfit(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textDark,
                        ),
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Change',
                    style: GoogleFonts.outfit(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Toggle & Count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      _buildtoggleBtn('Map', FontAwesomeIcons.map, isMapView),
                      _buildtoggleBtn(
                        'List',
                        FontAwesomeIcons.list,
                        !isMapView,
                      ),
                    ],
                  ),
                ),
                Text(
                  '14 clinics nearby',
                  style: GoogleFonts.outfit(
                    fontSize: 12,
                    color: AppColors.textLight,
                  ),
                ),
              ],
            ),
          ),

          // Content
          Expanded(child: isMapView ? _buildMapView() : _buildListView()),
        ],
      ),
    );
  }

  Widget _buildtoggleBtn(String label, IconData icon, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isMapView = label == 'Map';
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 12,
              color: isSelected ? Colors.white : AppColors.textDark,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: GoogleFonts.outfit(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : AppColors.textDark,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMapView() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        // Mock Map Image Placeholder
        Container(
          color: const Color(0xFFE5E5E5),
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            children: [
              // Grid lines or pattern to look like map
              // Placeholder pins
              Positioned(
                top: 100,
                left: 100,
                child: Icon(Icons.location_on, color: Colors.red),
              ),
              Positioned(
                top: 200,
                right: 80,
                child: Icon(Icons.location_on, color: Colors.red),
              ),
              Positioned(
                bottom: 250,
                left: 50,
                child: Icon(Icons.location_on, color: Colors.red),
              ),
              Positioned(
                bottom: 200,
                right: 150,
                child: Icon(Icons.location_on, color: Colors.blue, size: 40),
              ), // Selected
            ],
          ),
        ),

        // Bottom Card
        Container(
          margin: const EdgeInsets.all(20),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Search Bar mockup
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search, color: AppColors.textLight),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Search',
                        style: GoogleFonts.outfit(color: AppColors.textLight),
                      ),
                    ),
                    const Icon(
                      Icons.close,
                      size: 16,
                      color: AppColors.textLight,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Selected Clinic Preview (Mock)
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'The London Independent Hospital',
                          style: GoogleFonts.outfit(
                            fontWeight: FontWeight.w700,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '1 Beaumont Square, London E1 4NL',
                          style: GoogleFonts.outfit(
                            fontSize: 12,
                            color: AppColors.textLight,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(
                              Icons.access_time,
                              size: 12,
                              color: Colors.green,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Open',
                              style: GoogleFonts.outfit(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              'Closes at 8:00 PM',
                              style: GoogleFonts.outfit(
                                fontSize: 12,
                                color: AppColors.textLight,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '0.22 miles',
                    style: GoogleFonts.outfit(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textLight,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildListView() {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        _buildClinicCard(
          name: 'ABC Hospital',
          specialty: 'Orthopedics · Sports Injuries',
          rating: 4.8,
          reviews: 124,
          distance: '0.8 mi',
          icon: FontAwesomeIcons.building,
          iconColor: Colors.green,
        ),
        _buildClinicCard(
          name: "John Doe's Hospital",
          specialty: 'Physical Therapy · Rehabilitation',
          rating: 4.6,
          reviews: 89,
          distance: '1.2 mi',
          icon: FontAwesomeIcons.userDoctor,
          iconColor: Colors.orange,
        ),
        _buildClinicCard(
          name: 'Wellness Sports Clinic',
          specialty: 'Sports Medicine · Wellness',
          rating: 4.7,
          reviews: 98,
          distance: '1.5 mi',
          icon: FontAwesomeIcons.heartPulse,
          iconColor: Colors.orange,
        ),
        _buildClinicCard(
          name: 'Urgent Care Hospital',
          specialty: 'Emergency Care · Walk-in',
          rating: 4.5,
          reviews: 156,
          distance: '2.4 mi',
          icon: FontAwesomeIcons.truckMedical,
          iconColor: Colors.orange,
        ),
      ],
    );
  }

  Widget _buildClinicCard({
    required String name,
    required String specialty,
    required double rating,
    required int reviews,
    required String distance,
    required IconData icon,
    required Color iconColor,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: GoogleFonts.outfit(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      specialty,
                      style: GoogleFonts.outfit(
                        fontSize: 11,
                        color: AppColors.textLight,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, size: 12, color: Colors.amber),
                        Text(
                          ' $rating ($reviews)',
                          style: GoogleFonts.outfit(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Icon(
                          Icons.location_on,
                          size: 12,
                          color: AppColors.primary,
                        ),
                        Text(
                          ' $distance',
                          style: GoogleFonts.outfit(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.call, size: 14, color: Colors.white),
                  label: Text(
                    'Call',
                    style: GoogleFonts.outfit(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(0, 36),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.calendar_month,
                    size: 14,
                    color: AppColors.textDark,
                  ),
                  label: Text(
                    'Book',
                    style: GoogleFonts.outfit(color: AppColors.textDark),
                  ),
                  style: OutlinedButton.styleFrom(
                    backgroundColor: AppColors.background,
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(0, 36),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
