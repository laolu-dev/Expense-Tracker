import 'package:flutter/material.dart';

import '../constants.dart';

class TotalBills extends StatefulWidget {
  final int monthlyBudget;
  final int remainder;
  const TotalBills(
      {super.key, required this.monthlyBudget, required this.remainder});

  @override
  State<TotalBills> createState() => _TotalBillsState();
}

class _TotalBillsState extends State<TotalBills> {
  double getPercentage(double value, double totalWidth) {
    return (value / 100) * totalWidth;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      decoration: BoxDecoration(
          border: Border.all(color: AppColors.neutralLight1),
          borderRadius: BorderRadius.circular(18),
          boxShadow: const [
            BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .06),
              blurRadius: 40,
              spreadRadius: -10,
              offset: Offset(0, 25),
            )
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Left to spend',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: AppColors.neutralLight4),
                  ),
                  Text(
                    '\$${widget.remainder}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.neutral,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  )
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Monthly budget',
                    style: Theme.of(context)
                        .textTheme
                        .titleSmall
                        ?.copyWith(color: AppColors.neutralLight4),
                  ),
                  Text(
                    '\$${widget.monthlyBudget}',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: AppColors.neutral,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  )
                ],
              )
            ],
          ),
          const SizedBox(height: 10),
          LayoutBuilder(
            builder: (_, constraints) => Stack(
              children: [
                ProgressValue(width: getPercentage(100, constraints.maxWidth), color: AppColors.neutralLight1),
                   ProgressValue(
                    width: getPercentage(100, constraints.maxWidth),
                    color: AppColors.neutralLight1),
                       ProgressValue(
                    width: getPercentage(60, constraints.maxWidth),
                    color: AppColors.primary),
                        ProgressValue(
                    width: getPercentage(30, constraints.maxWidth),
                    color: AppColors.secondaryTwo),
                       ProgressValue(
                    width: getPercentage(15, constraints.maxWidth),
                    color: AppColors.secondary)
              ],
            ),
          )
        ],
      ),
    );
  }
}

class ProgressValue extends StatelessWidget {
  final double width;
  final Color color;
  const ProgressValue({super.key, required this.width, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 5,
      width: width,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
