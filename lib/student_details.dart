import 'package:flutter/material.dart';

class StudentDetails extends StatelessWidget {
  const StudentDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF49AAFF),
        child: Column(
          children: [
            SizedBox(height: 10.0),
            // Main content
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  color: Color(0xFFDEEBFA),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x0D000000),
                      blurRadius: 60,
                      offset: Offset(0, -20),
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 40),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Back button aligned to left
                            Positioned(
                              left: 0,
                              child: IconButton(
                                icon: const Icon(
                                  Icons.chevron_left_sharp,
                                  size: 35.0,
                                ),
                                onPressed: () => Navigator.pop(context),
                              ),
                            ),
                            // Centered title text
                            const Expanded(
                              child: Center(
                                child: Text(
                                  'Student Details',
                                  style: TextStyle(
                                    color: Color(0xFF373737),
                                    fontSize: 24,
                                    fontFamily: 'Outfit',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                            // Invisible spacer to balance the row
                            const Opacity(
                              opacity: 0,
                              child: IconButton(
                                icon: Icon(Icons.chevron_left, size: 35.0),
                                onPressed: null,
                              ),
                            ),
                          ],
                        ),
                      ),
                      // Profile section
                      _buildProfileSection(),

                      // Details card
                      _buildDetailsCard(),

                      // Input field
                      _buildInputField(),

                      // Remove User button
                      _buildRemoveButton(),

                      // Bottom spacer
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 41,
            backgroundColor: Color(0xFFD9D9D9),
            child: Icon(Icons.person, size: 60, color: Colors.grey),
          ),
          const SizedBox(height: 16),
          const Text(
            'John Bod',
            style: TextStyle(
              color: Color(0xFF171D2E),
              fontSize: 26,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'rku@rku.ac.in',
            style: TextStyle(
              color: Color(0xB5171C2E),
              fontSize: 20,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _buildDetailsCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Color(0x44C4D3E5),
            blurRadius: 19,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildDetailColumn('Name', 'Rku Collage'),
          _buildDivider(),
          _buildDetailColumn('E-mail', 'rku@rku.ac.in'),
          _buildDivider(),
          _buildDetailColumn('Department', 'B.Tech'),
          _buildDivider(),
          _buildDetailColumn('Branch', 'CE'),
          _buildDivider(),
          _buildDetailColumn('Sem', '3rd'),
          _buildDivider(),
          _buildDetailColumn('Div', 'A'),
        ],
      ),
    );
  }

  Widget _buildDetailColumn(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: Color(0xFF171D2E),
                  fontSize: 16,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                value,
                style: TextStyle(
                  color: Colors.black.withOpacity(0.5),
                  fontSize: 14,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() {
    return Container(
      height: 1,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      color: Colors.black.withOpacity(0.07),
    );
  }

  Widget _buildInputField() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFDEEAFA),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF3C5AF6), width: 2),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Declare Wiener',
            style: TextStyle(
              color: Color(0xF43C5AF6),
              fontSize: 16,
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRemoveButton() {
    return Container(
      width: 295,
      margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF3C5AF6),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Center(
        child: Text(
          'Remove User',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
