import 'package:flutter/material.dart';
import 'login_screen.dart';

class RoleScreen extends StatefulWidget {
  const RoleScreen({super.key});

  @override
  State<RoleScreen> createState() => _RoleScreenState();
}

class _RoleScreenState extends State<RoleScreen> {
  String? selectedRole;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFF6F9FF),
              Color(0xFFEAF2FF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const Icon(
                    Icons.shield_outlined,
                    size: 85,
                    color: Color(0xFF4A6FA5),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "SafeKids",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2C3E50),
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Silakan pilih peran Anda",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                    ),
                  ),

                  const SizedBox(height: 35),

                  // ================= ADMIN (DI ATAS) =================
                  RoleCard(
                    title: "Admin",
                    icon: Icons.admin_panel_settings_outlined,
                    color: const Color(0xFFF2A65A),
                    isSelected: selectedRole == "admin",
                    onTap: () {
                      setState(() {
                        selectedRole = "admin";
                      });
                    },
                  ),

                  const SizedBox(height: 15),

                  // ================= GURU =================
                  RoleCard(
                    title: "Guru",
                    icon: Icons.school_outlined,
                    color: const Color(0xFF6C9BCF),
                    isSelected: selectedRole == "guru",
                    onTap: () {
                      setState(() {
                        selectedRole = "guru";
                      });
                    },
                  ),

                  const SizedBox(height: 15),

                  // ================= ORANG TUA =================
                  RoleCard(
                    title: "Orang Tua",
                    icon: Icons.family_restroom_outlined,
                    color: const Color(0xFF7BC8A4),
                    isSelected: selectedRole == "orang_tua",
                    onTap: () {
                      setState(() {
                        selectedRole = "orang_tua";
                      });
                    },
                  ),

                  const SizedBox(height: 35),

                  // ================= BUTTON LANJUTKAN =================
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: selectedRole == null
                          ? null
                          : () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const LoginScreen(),
                                ),
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4A6FA5),
                        disabledBackgroundColor: Colors.grey.shade300,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "Lanjutkan",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ================= ROLE CARD WIDGET =================
class RoleCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.all(18),
        width: double.infinity,
        decoration: BoxDecoration(
          color: isSelected ? color.withOpacity(0.15) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? color : Colors.grey.shade200,
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: color.withOpacity(0.15),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 15),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Color(0xFF2C3E50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}