import 'package:flutter/material.dart';

import 'package:modavest_core/domain/models/customer.dart';
import 'package:modavest_core/widgets/text/modavest_title.dart';

class CustomerCard extends StatelessWidget {
  final Customer customer;
  final Function()? onTap;
  const CustomerCard({super.key, required this.customer, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          side: BorderSide(
            color: Colors.grey,
            width: 0.5,
          ),
        ),
        child: FittedBox(
          child: Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.2,
                margin: const EdgeInsets.all(10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.2,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: customer.image != null
                      ? Image.network(
                          customer.image!,
                        )
                      : FittedBox(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 1),
                            child: CircleAvatar(
                              backgroundColor: Theme.of(context).primaryColor,
                              child: Text(
                                ((customer.name ?? customer.fantasyName) ?? "")
                                    .substring(0, 1),
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ModavestTitle(
                      (customer.name ?? customer.fantasyName) ?? "",
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
