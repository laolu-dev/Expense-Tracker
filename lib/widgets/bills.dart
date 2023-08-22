import 'package:flutter/material.dart';
import 'package:demo/constants.dart';

class Bills extends StatefulWidget {
  final Color widgetColor;
  final IconData billIconWidget;
  final String widgetName;
  final int totalBudget;
  final List<Widget> expenses;
  const Bills(
      {super.key,
      required this.widgetColor,
      required this.widgetName,
      required this.billIconWidget,
      required this.totalBudget,
      required this.expenses});

  @override
  State<Bills> createState() => _BillsState();
}

class _BillsState extends State<Bills> {
  Widget expenseOverhead() => Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.only(right: 15),
            decoration: BoxDecoration(
              color: widget.widgetColor.withOpacity(.2),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Icon(widget.billIconWidget, color: widget.widgetColor),
          ),
          Expanded(
            child: Text(
              widget.widgetName,
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(fontSize: 16),
            ),
          ),
          const SizedBox(width: 72),
          Text(
            '\$${widget.totalBudget}',
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(color: AppColors.neutralLight3),
          ),
        ],
      );

  List<Widget> body() =>
      [expenseOverhead(), const SizedBox(height: 20), ...widget.expenses];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
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
      child: Column(children: body()),
    );
  }
}
