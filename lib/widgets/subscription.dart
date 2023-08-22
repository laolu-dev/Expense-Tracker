import 'package:demo/model/subscribed_item.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class Subscription extends StatefulWidget {
  const Subscription({super.key});

  @override
  State<Subscription> createState() => _SubscriptionState();
}

class _SubscriptionState extends State<Subscription> {
  late double total;

  double calculateTotal() {
    var total = 0.0;
    for (var element in _item) {
      total += element.amountPerMonth;
    }
    return total;
  }

  @override
  void initState() {
    super.initState();
    total = calculateTotal();
  }

  final List<SubscribedItem> _item = [
    SubscribedItem(
        picture: "assets/icons/patreon.png",
        name: 'Patreon membership',
        amountPerMonth: 19.99),
    SubscribedItem(
        picture: "assets/icons/netflix.png",
        name: 'Netflix',
        amountPerMonth: 12),
    SubscribedItem(
        picture: "assets/icons/apple.png",
        name: 'Apple payment',
        amountPerMonth: 19.99),
    SubscribedItem(
        picture: "assets/icons/spotify.png",
        name: 'Spotify',
        amountPerMonth: 6.99)
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 30),
      child: Column(
        children: [
          SizedBox(
            width: 159,
            child: Text(
              'Your monthly payment for subcriptions',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(color: AppColors.neutral),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            '\$$total',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                color: AppColors.neutral, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 40),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.neutralLight1),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0),
                    blurRadius: 40,
                    spreadRadius: -10,
                    offset: const Offset(0, 25),
                  )
                ]),
            child: Column(
              children: _item
                  .map(
                    (e) => Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: ListTile(
                        leading: Image.asset(e.picture),
                        title: Text(e.name),
                        subtitle: Text('\$${e.amountPerMonth}/mo'),
                        trailing:
                            const Icon(Icons.navigate_next_rounded, size: 32),
                      ),
                    ),
                  )
                  .toList(),
            ),
          )
        ],
      ),
    );
  }
}
