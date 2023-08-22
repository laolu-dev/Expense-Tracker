import 'package:flutter/material.dart';

import '../constants.dart';
import '../widgets/nav_bar.dart';

class CreditScore extends StatelessWidget {
  CreditScore({super.key});

  final date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Widget scoreCriteria({
      required String criteria,
      required String status,
      required String score,
      required String meta,
    }) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  criteria,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.neutral),
                ),
                const SizedBox(height: 15),
                Text(
                  status,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: status == "Good"
                          ? AppColors.greenAccent
                          : AppColors.orange),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  score,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontWeight: FontWeight.bold, color: AppColors.neutral),
                ),
                const SizedBox(height: 15),
                Text(
                  meta,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: status == "Good"
                          ? AppColors.greenAccent
                          : AppColors.orange),
                ),
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.navigate_before),
        ),
        title: const Text('Credit Score'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '400',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.neutralLight3),
                ),
                Text(
                  'Last updated on ${date.day}-${date.month}-${date.year}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.neutralLight4),
                ),
                Text(
                  '850',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge
                      ?.copyWith(color: AppColors.neutralLight3),
                ),
              ],
            ),
            const SizedBox(height: 40),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
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
                children: [
                  scoreCriteria(
                      criteria: "On-time payments",
                      status: 'Good',
                      score: "95%",
                      meta: "1 missed"),
                  Divider(color: AppColors.neutralLight3),
                  const SizedBox(height: 10),
                  scoreCriteria(
                      criteria: "Credit Utilization",
                      status: 'Not bad',
                      score: "95%",
                      meta: "-15%"),
                  Divider(color: AppColors.neutralLight3),
                  const SizedBox(height: 10),
                  scoreCriteria(
                      criteria: "Age of credit",
                      status: 'Good',
                      score: '8 year',
                      meta: "")
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }
}
