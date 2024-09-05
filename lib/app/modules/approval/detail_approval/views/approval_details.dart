import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../common/models/approval_details.dart';
import '../../../../utils/constant/style/text_styles.dart';

class ApprovalDetails extends StatelessWidget {
  final Data approval;
  final NumberFormat currencyFormat;

  const ApprovalDetails({
    Key? key,
    required this.approval,
    required this.currencyFormat,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Approval Header Information
            _buildSectionHeader('Approval Information'),
            buildTextHeaderColumn('Name', approval.name),
            if (approval.property != null)
              _buildPropertyDetailsSection(approval.property!),
            if (approval.purchaseOrder != null)
              _buildPurchaseOrderSection(approval.purchaseOrder!),
            if (approval.purchaseRequisition != null)
              _buildPurchaseRequisitionSection(approval.purchaseRequisition!),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Text(
        title,
        style: TextStyles.headerFieldStyle.copyWith(color: Colors.blue),
      ),
    );
  }

  Widget _buildPropertyDetailsSection(Property property) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Property Details'),
            buildTextColumn('Contract Number', property.contractNo),
            buildTextColumn('Customer Code', property.customerCode),
            buildTextColumn('Unit Code', property.unitCode),
            buildCurrencyColumn('Contract Value Netto',
                property.contractValueNetto, currencyFormat),
            buildCurrencyColumn('Contract Value Brutto',
                property.contractValueBrutto, currencyFormat),
            buildCurrencyColumn(
                'Bookiing Fee Netto', property.bookingFeeNetto, currencyFormat),
            buildCurrencyColumn('Bookiing Fee Brutto', property.bookingFeeBruto,
                currencyFormat),
            buildTextColumn('Progress Count', property.progressConst),
            buildTextColumn('Cancel Date', property.cancelDate),
            buildCurrencyColumn('Refund Recommendation',
                property.refundRecommendation, currencyFormat),
            buildCurrencyColumn(
                'Ri Refund', property.riRefound, currencyFormat),
            buildCurrencyColumn('Recommendation Value',
                property.recommendationValue, currencyFormat),
            // Add other details similarly...
          ],
        ),
      ),
    );
  }

  Widget _buildPurchaseOrderSection(PurchaseOrder purchaseOrder) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Purchase Order Details'),
            buildTextColumn('Document Date', purchaseOrder.docDate),
            buildTextColumn('PO Type', purchaseOrder.poType),
            buildTextColumn('', purchaseOrder.typeDesc),
            buildTextColumn('Vendor', purchaseOrder.vendor),
            buildTextColumn('', purchaseOrder.vendorDesc),
            buildCurrencyColumn(
                'Total Price', purchaseOrder.totalPrice, currencyFormat),
            SizedBox(height: 10),
            // buildTextColumn('PO Organization', purchaseOrder.poOrg),
            // buildTextColumn('Release Group', purchaseOrder.releaseGroup),
            // buildTextColumn(
            // 'Release Group Description', purchaseOrder.releaseGroupDesc),
            // buildTextColumn('PO Number', purchaseOrder.poNumber),
            buildTextColumn('Approval Status', purchaseOrder.approvalStatus),
            buildTextColumn(
              'Attachment Link',
              (
                approval.purchaseOrder!.attachmentLink != null
                    ? InkWell(
                        onTap: () async {
                          // Cek apakah URL ada dan valid
                          final link =
                              approval.purchaseOrder!.attachmentLink ?? '';
                          print(link);

                          // Jika link kosong, gunakan pencarian
                          final searchQuery = Uri.encodeComponent(link);
                          final searchUrl =
                              'https://www.google.com/search?q=$searchQuery';

                          final url =
                              Uri.tryParse(link.isNotEmpty ? link : searchUrl);

                          if (url != null && await canLaunchUrl(url)) {
                            await launchUrl(
                              url,
                              mode: LaunchMode
                                  .externalApplication, // Tambahkan mode ini
                            );
                          } else {
                            print('Could not launch $url');
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.open_in_new,
                              color: Colors.blue,
                            ), // Ikon yang diinginkan
                          ],
                        ),
                      )
                    : Text('No Link'),
              ),
            ),
            _buildServiceDetailsList(purchaseOrder.itemsPo!),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceDetailsList(List<ItemPo> itemsPo) {
    return ExpansionTile(
      tilePadding: EdgeInsets.zero,
      initiallyExpanded: false,
      title: Text(
        'Purchase Order Items',
        style: TextStyles.headerFieldStyle.copyWith(color: Colors.blue),
      ),
      children: [
        for (var i = 0; i < itemsPo.length; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: _buildItemDetails(i + 1, itemsPo[i]),
          ),
      ],
    );
  }

  Widget _buildItemDetails(int itemNumber, ItemPo item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextColumn('> Item $itemNumber', item.materialDesc),
        SizedBox(height: 5),
        // buildTextColumn('PO Item', item.poItem),
        buildTextColumn('Material Code', item.materialCode),
        buildTextColumn('Quantity', '${item.poQuantity} ${item.poUnit}'),
        buildCurrencyColumn('Unit Price', item.unitPrice, currencyFormat),
        buildCurrencyColumn(
            'Item Total Price', item.itemTotalPrice, currencyFormat),
        buildTextColumn('Delivery Date', item.deliveryDate),
        SizedBox(height: 10),
        ExpansionTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(
            'Service Details',
            style: TextStyles.approvalTextStyle.copyWith(color: Colors.blue),
          ),
          children: [
            for (var j = 0; j < item.details.length; j++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: _buildServiceDetails(j + 1, item.details[j]),
              ),
          ],
        ),
        const Divider(color: Colors.grey, thickness: 1),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildServiceDetails(int serviceNumber, DetailPo detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextColumn('Service $serviceNumber', detail.serviceDesc),
        buildTextColumn('Service Code', detail.serviceNo),
        buildTextColumn('Latest Gr Date', detail.latestGrDate),
        buildTextColumn('Service Quantity',
            '${detail.serviceQuantity} ${detail.serviceUnit}'),
        buildCurrencyColumn('Unit Price', detail.servicePrice, currencyFormat),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildPurchaseRequisitionSection(
      PurchaseRequisition purchaseRequisition) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionHeader('Purchase Requisition Details'),
            buildTextColumn('PR Type', purchaseRequisition.prType),
            buildTextColumn('', purchaseRequisition.typeDesc),
            if (purchaseRequisition.registeredVendors != null)
              for (var i = 0;
                  i < purchaseRequisition.registeredVendors!.length;
                  i++) ...[
                buildTextColumn('Registered Vendor ${i + 1}',
                    purchaseRequisition.registeredVendors![i].desc ?? '-'),
              ],

            // Loop New Vendors
            if (approval.purchaseRequisition!.newVendors != null)
              for (var i = 0;
                  i < purchaseRequisition.newVendors!.length;
                  i++) ...[
                buildTextColumn('New Vendor ${i + 1}',
                    purchaseRequisition.newVendors![i].name ?? '-'),
                buildTextColumn('Location Vendor ${i + 1}',
                    purchaseRequisition.newVendors![i].location ?? '-'),
              ],
            buildCurrencyColumn('Pagu Anggaran',
                purchaseRequisition.budgetValue, currencyFormat),
            buildCurrencyColumn('Total Harga Perkiraan Sendiri',
                purchaseRequisition.grandTotalValue, currencyFormat),
            buildTextColumn(
              'Attachment Link',
              (
                purchaseRequisition.prType != null
                    ? InkWell(
                        onTap: () async {
                          // Cek apakah URL ada dan valid
                          final link = purchaseRequisition.prType ?? '';
                          print(link);

                          // Jika link kosong, gunakan pencarian
                          final searchQuery = Uri.encodeComponent(link);
                          final searchUrl =
                              'https://www.google.com/search?q=$searchQuery';

                          final url =
                              Uri.tryParse(link.isNotEmpty ? link : searchUrl);

                          if (url != null && await canLaunchUrl(url)) {
                            await launchUrl(
                              url,
                              mode: LaunchMode
                                  .externalApplication, // Tambahkan mode ini
                            );
                          } else {
                            print('Could not launch $url');
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Icon(
                              Icons.open_in_new,
                              color: Colors.blue,
                            ), // Ikon yang diinginkan
                          ],
                        ),
                      )
                    : Text('No Link'),
              ),
            ),

            SizedBox(height: 10),
            _buildRequisitionItemsList(purchaseRequisition.itemspr!),
          ],
        ),
      ),
    );
  }

  Widget _buildRequisitionItemsList(List<ItemPr> itemsPr) {
    return ExpansionTile(
      title: Text(
        'Requisition Items',
        style: TextStyles.headerFieldStyle.copyWith(color: Colors.blue),
      ),
      children: [
        for (var i = 0; i < itemsPr.length; i++)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: _buildItemPrDetails(i + 1, itemsPr[i]),
          ),
      ],
    );
  }

  Widget _buildItemPrDetails(int itemNumber, ItemPr itemPr) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextColumn('> Item $itemNumber', itemPr.materialDesc),
        buildTextColumn('Item Category', itemPr.itemCategory),
        buildTextColumn('Material Code', itemPr.materialCode),
        SizedBox(height: 5),
        buildTextColumn('Account Assignment', itemPr.accountAssignment),
        buildTextColumn(
            'Quantity', '${itemPr.prQuantity} ${itemPr.prOrderUnit}'),
        buildCurrencyColumn('Unit Price', itemPr.unitPrice, currencyFormat),
        buildTextColumn('Quantity Per Unit Price', itemPr.priceUnit),
        buildCurrencyColumn('Total Value', itemPr.totalValue, currencyFormat),
        ExpansionTile(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          title: Text(
            'Item Details',
            style: TextStyles.approvalTextStyle.copyWith(color: Colors.blue),
          ),
          children: [
            for (var j = 0; j < itemPr.details!.length; j++)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: _buildServicePrDetails(j + 1, itemPr.details![j]),
              ),
          ],
        ),
        Divider(color: Colors.grey, thickness: 1),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildServicePrDetails(int serviceNumber, DetailPr detail) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildTextColumn('Service $serviceNumber', detail.serviceDesc),
        // buildTextColumn('Latest Gr Date', detail.latestGrDate),
        buildTextColumn('Service Code', detail.serviceNo),
        buildTextColumn('Service Quantity',
            '${detail.serviceQuantity} ${detail.serviceUnit}'),
        buildCurrencyColumn(
            'Service Price', detail.servicePrice, currencyFormat),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Divider(color: Colors.grey, thickness: 1),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget buildTextHeaderColumn(String label, String? value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyles.approvalTextStyle),
          Text(value ?? '-', style: TextStyles.buttonprofileTextStyle),
        ],
      ),
    );
  }

  Widget buildTextColumn(String label, dynamic value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(
              label,
              style: TextStyles.approvalTextStyle.copyWith(fontSize: 14),
            ),
          ),
          Flexible(
            child: value != null && value is String && value.isNotEmpty
                ? Text(
                    value,
                    style: TextStyles.buttonprofileTextStyle
                        .copyWith(fontSize: 14),
                    textAlign: TextAlign.right, // Align text to the right
                  )
                : Text(
                    '-',
                    style: TextStyles.buttonprofileTextStyle
                        .copyWith(fontSize: 14),
                    textAlign: TextAlign.right, // Align text to the right
                  ),
          ),
        ],
      ),
    );
  }

  Widget buildCurrencyColumn(String label, String? value, NumberFormat format) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: Text(label,
                style: TextStyles.approvalTextStyle.copyWith(fontSize: 14)),
          ),
          Flexible(
            child: Text(
              value == null || value.isEmpty
                  ? '-'
                  : format
                      .format(double.tryParse(value.replaceAll('.', '')) ?? 0),
              style: TextStyles.buttonprofileTextStyle.copyWith(fontSize: 14),
              textAlign: TextAlign.right, // Align text to the right
            ),
          ),
        ],
      ),
    );
  }
}
