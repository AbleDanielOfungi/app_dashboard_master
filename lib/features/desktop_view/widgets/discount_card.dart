import 'package:flutter/material.dart';
import 'package:yookatale/features/payment/widgets/flutter_wave.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 200,
          height: 200,
          // height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.green.withOpacity(0.2),
            image: const DecorationImage(
              image: AssetImage(
                'assets/grocery.jpeg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            width: 200,
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.green.withOpacity(0.7),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const DiscountInfoTile(),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const FlutterWavePage(title: 'Payment Page')),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.8),
                    padding: EdgeInsets.zero,
                    fixedSize: const Size(90, 40),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Shop Now',
                    style: TextStyle(
                      fontFamily: 'Cabin',
                      color: Color(0xff018868),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class DiscountInfoTile extends StatelessWidget {
  const DiscountInfoTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '30% Discount',
          style: TextStyle(
              fontFamily: 'Cabin', fontWeight: FontWeight.w600, fontSize: 16),
        ),
        Text(
          'Order from Yookatale \n and  get the discount',
          style: TextStyle(
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}
