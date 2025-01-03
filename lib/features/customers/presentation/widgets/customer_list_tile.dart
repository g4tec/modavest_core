import 'package:auto_size_text_pk/auto_size_text_pk.dart';
import 'package:flutter/material.dart';
import 'package:modavest_core/assets/modavest_legal_person_status.dart';
import 'package:modavest_core/domain/models/customer.dart';
import 'package:modavest_core/utils/format_cnpj_cpf.dart';

class CustomerListTile extends StatelessWidget {
  final Customer customer;
  final double width;
  final Function(Customer customer)? onTapFinishRegister;
  final Function(Customer customer)? onTap;
  const CustomerListTile({
    super.key,
    required this.customer,
    required this.width,
    this.onTap,
    this.onTapFinishRegister,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: GestureDetector(
        onTap: () => onTap?.call(customer),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              SizedBox(
                width: width * 0.16,
                height: 60,
                child: customer.image != null
                    ? Image.network(customer.image!)
                    : FittedBox(
                        child: CircleAvatar(
                          backgroundColor: Theme.of(context).primaryColor,
                          child: Text(
                            ((customer.name ?? "").isEmpty
                                        ? "-"
                                        : customer.name!)
                                    .substring(0, 1) ??
                                "",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: customer.code == null
                                  ? FontStyle.italic
                                  : null,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
              ),
              Column(
                children: [
                  Container(
                    width: width * 0.67,
                    height: 80,
                    padding: EdgeInsets.only(left: width * 0.05),
                    alignment: Alignment.centerLeft,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AutoSizeText(
                          customer.name ??
                              (customer.fantasyName ?? customer.integrationId)
                                  .toString(),
                          maxLines: 2,
                          style:
                              LegalPersonStatus.active.style(context)?.copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontStyle: customer.code == null
                                        ? FontStyle.italic
                                        : null,
                                  ),
                        ),
                        if (customer.cpfCnpj != null)
                          AutoSizeText(
                            formatCnpjCpf(customer.cpfCnpj.toString(),
                                prefixCNPJ: 'CNPJ: ', prefixCPF: 'CPF: '),
                            style: LegalPersonStatus.active
                                .style(context)
                                ?.copyWith(
                                  fontSize: 14,
                                  fontStyle: customer.code == null
                                      ? FontStyle.italic
                                      : null,
                                ),
                          ),
                        if (customer.code == null)
                          AutoSizeText(
                            "Pré cadastro",
                            style: LegalPersonStatus.active
                                .style(context)
                                ?.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: customer.code == null
                                      ? FontStyle.italic
                                      : null,
                                ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                width: width * 0.10,
                child: customer.code == null
                    ? IconButton(
                        onPressed: () => onTapFinishRegister?.call(customer),
                        icon: Icon(
                          Icons.save,
                          size: 20,
                          color: Colors.white,
                        ),
                      )
                    : const SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
