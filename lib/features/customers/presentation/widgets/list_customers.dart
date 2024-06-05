import 'package:flutter/material.dart';
import 'package:modavest_core/assets/moda_vest_labels.dart';
import 'package:modavest_core/domain/models/customer.dart';
import 'package:modavest_core/features/customers/presentation/widgets/customer_card.dart';
import 'package:modavest_core/features/products/presentation/widgets/search/search_input.dart';
import 'package:modavest_core/widgets/buttons/dotted_add_card.dart';
import 'package:modavest_core/widgets/loading/sending_loading.dart';
import 'package:modavest_core/widgets/text/page_title_back.dart';

class ListCustomers extends StatefulWidget {
  final List<Customer> customers;
  final Function()? onAdd;
  final Function(String value)? onSearch;
  final Function(Customer customer)? onTapCustomer;

  final Future<void> Function() onRefresh;
  const ListCustomers({
    super.key,
    required this.customers,
    required this.onRefresh,
    this.onAdd,
    this.onSearch,
    this.onTapCustomer,
  });

  @override
  State<ListCustomers> createState() => _ListCustomersState();
}

class _ListCustomersState extends State<ListCustomers> {
  late ScrollController scrollcontroller;
  int partionPages = 50;
  final int pageSize = 50;

  @override
  void initState() {
    scrollcontroller = ScrollController()..addListener(pagination);

    super.initState();
  }

  Future<void> pagination() async {
    if (scrollcontroller.position.pixels ==
            scrollcontroller.position.maxScrollExtent &&
        widget.customers.length > partionPages) {
      setState(() {
        partionPages = partionPages + pageSize;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TitlePageBack(title: ModaVestLabels.customersPortfolio),
          Expanded(
            child: RefreshIndicator(
              onRefresh: widget.onRefresh,
              child: ListView(
                controller: scrollcontroller,
                children: [
                  if (widget.onAdd != null)
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: DottedAddCard(
                        onAdd: widget.onAdd,
                        title: ModaVestLabels.addCustomer,
                      ),
                    ),
                  if (widget.onSearch != null)
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: SearchInput(
                        title: ModaVestLabels.searchForClient,
                        onChange: widget.onSearch,
                      ),
                    ),
                  if (widget.customers.isEmpty)
                    const Center(
                      child: Text("Não foram encontrados clientes"),
                    )
                  else
                    ListView.builder(
                      itemCount: partionPages >= widget.customers.length
                          ? widget.customers.length
                          : partionPages,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      cacheExtent: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return CustomerCard(
                          customer: widget.customers[index],
                          onTap: () => widget.onTapCustomer
                              ?.call(widget.customers[index]),
                        );
                      },
                    ),
                  if (widget.customers.length > partionPages)
                    SendingLoading(
                      title: ModaVestLabels.loadingMoreCustomers,
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
