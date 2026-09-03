import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sooqy/core/resources/assets_manager.dart';
import 'package:sooqy/core/resources/color_manager.dart';
import 'package:sooqy/core/resources/styles_manager.dart';
import 'package:sooqy/features/profile/domain/entities/order_data.dart';

class MyOrderCard extends StatefulWidget {
  const MyOrderCard({super.key, required this.order});

  final OrderData order;

  @override
  State<MyOrderCard> createState() => _MyOrderCardState();
}

class _MyOrderCardState extends State<MyOrderCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: ColorManager.grey.withValues(alpha: 0.1),
            border: Border.all(color: ColorManager.gradiant2, width: 2),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SvgPicture.asset(IconsAssets.order),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Order Number : ${widget.order.orderCode}',
                              style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: 16,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isExpanded = !isExpanded;
                                });
                              },
                              color: Colors.grey,
                              iconSize: 30,
                              icon: isExpanded
                                  ? const Icon(Icons.keyboard_arrow_up_rounded)
                                  : const Icon(
                                      Icons.keyboard_arrow_down_rounded,
                                    ),
                            ),
                          ],
                        ),
                        Text(
                          "Order Date: ${widget.order.createdAt.toString().split(' ').first}",
                          style: getRegularStyle(
                            color: ColorManager.grey,
                            fontSize: 13,
                          ),
                          maxLines: 1,
                        ),
                        const SizedBox(height: 4),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "${widget.order.totalPrice.toStringAsFixed(2)} EGP",
                              style: getBoldStyle(
                                color: ColorManager.black,
                                fontSize: 16,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: ColorManager.lightSecColor.withValues(
                                  alpha: 0.3,
                                ),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(widget.order.status),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              AnimatedSize(
                duration: const Duration(milliseconds: 600),
                curve: Curves.easeInOut,
                child: isExpanded
                    ? Column(
                        children: [
                          const SizedBox(height: 12),
                          const Divider(thickness: 2),
                          const SizedBox(height: 4),
                          ExpandedInfoCard(
                            title: 'payment method',
                            date: widget.order.paymentMethod,
                          ),
                          ExpandedInfoCard(
                            title: 'Order placed',
                            date: widget.order.createdAt
                                .toString()
                                .split(' ')
                                .first,
                          ),
                          ExpandedInfoCard(
                            title: 'Delivery in progress',
                            date: widget.order.updatedAt
                                .toString()
                                .split(' ')
                                .first,
                          ),
                          const ExpandedInfoCard(
                            title: 'Delivered',
                            date: 'Pending',
                            done: false,
                          ),
                        ],
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ExpandedInfoCard extends StatelessWidget {
  final String title;
  final String date;
  final bool done;
  const ExpandedInfoCard({
    super.key,
    required this.title,
    required this.date,
    this.done = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: getBoldStyle(
              color: done ? ColorManager.primaryColor : ColorManager.black,
              fontSize: 16,
            ),
          ),
          Text(
            date,
            style: getRegularStyle(
              color: done ? ColorManager.primaryColor : ColorManager.grey,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
