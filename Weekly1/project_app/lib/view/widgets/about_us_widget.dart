import 'package:flutter/material.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 216,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Card(
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.network(
                    'https://kprofiles.com/wp-content/uploads/2019/01/C6FEA901-3EDF-47A4-BD76-FF33A771BE7B-533x800.jpeg',
                    width: 100,
                  ),
                  const Text(
                    'Yeji (예지)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    'Leader of Itzy',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.network(
                    'https://kprofiles.com/wp-content/uploads/2019/01/C7B868EA-A825-4028-9C15-CD41AD0A6D73-533x800.jpeg',
                    width: 100,
                  ),
                  const Text(
                    'Lia (리아)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    'Main Vocal of Itzy',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.network(
                    'https://kprofiles.com/wp-content/uploads/2019/01/B6635DC6-675D-4BDA-926B-ED0C4823904E-533x800.jpeg',
                    width: 100,
                  ),
                  const Text(
                    'Ryujin (류진)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    'Center of Itzy',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.network(
                    'https://kprofiles.com/wp-content/uploads/2019/01/EB01DCA5-7096-4338-AA89-1AF72B4AC283-533x800.jpeg',
                    width: 100,
                  ),
                  const Text(
                    'Chaeryeong (채령)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    'Main Dancer of Itzy',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            elevation: 20,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.network(
                    'https://kprofiles.com/wp-content/uploads/2019/01/59492EA5-8747-4447-9379-49D91C333B1A-533x800.jpeg',
                    width: 100,
                  ),
                  const Text(
                    'Yuna (유나)',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text(
                    'Visual of Itzy',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
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
