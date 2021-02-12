part of '../pages.dart';


class OrderDetailPage2 extends StatefulWidget {
  final order;

  const OrderDetailPage2({Key key, this.order}) : super(key: key);

  @override
  _OrderDetailPage2State createState() => _OrderDetailPage2State();
}

class _OrderDetailPage2State extends State<OrderDetailPage2> {
  @override
  Widget build(BuildContext context) {
    print(widget.order);

    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title:
        Text('Order Details', style: theme.textTheme.headline3).tr(),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.0),
              Text('Products', style: theme.textTheme.headline3).tr(),
              SizedBox(height: 12.0),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,

                child: Row(
                  children: widget.order['OrderDetails'].map<Widget>((e) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 100.0,
                        width: 130,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15.0),
                          border: Border.all(color: Theme.of(context).accentColor),
                        ),
                        padding: EdgeInsets.all(12.0),
                        margin: EdgeInsets.only(bottom: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    e['ItemName'].toString(),
                                    style: Theme.of(context).textTheme.headline4,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Spacer(),
                                  Text(
                                    "$priceGlobal ${e['Price'].toString()}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline3
                                        .copyWith(color: kPrimaryColor),
                                  ),
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    );

                  }).toList(),
                ),
              ),
              SizedBox(height: 15.0),
              Text('Order Details',
                  style: Theme.of(context).textTheme.headline3)
                  .tr(),
              SizedBox(height: 12.0),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Theme.of(context).accentColor),
                ),
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    orderCardItem(context,
                        title: "Order No",
                        data: widget.order['ID'].toString()),
                    SizedBox(height: 12.0),
                    // orderCardItem(context,
                    //     title: "order.shipping",
                    //     data: "\$ ${order.shippingPrice}"),
                    // SizedBox(height: 12.0),
                orderCardItem(context,
                    title: "Order Date",
                    data: widget.order['OrderDate'].toString()),
                SizedBox(height: 4.0),

                ]),
              ),
              SizedBox(height: 15.0),

              // Container(
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15.0),
              //     border: Border.all(color: Theme.of(context).accentColor),
              //   ),
              //   padding: EdgeInsets.all(12.0),
              //   child: Column(
              //     children: [
              //       orderCardItem(context,
              //           title: "order.shippingdate", data: order.dateShipping),
              //       SizedBox(height: 12.0),
              //       orderCardItem(context,
              //           title: "order.shippingtype", data: order.shipping),
              //       SizedBox(height: 12.0),
              //       orderCardItem(context,
              //           title: "order.shippingid", data: order.noResi),
              //       SizedBox(height: 12.0),
              //       orderCardItem(context,
              //           title: "order.destination", data: order.address),
              //     ],
              //   ),
              // ),
              // SizedBox(height: 15.0),
              Text('Payment Details',
                  style: Theme.of(context).textTheme.headline3)
                  .tr(),
              SizedBox(height: 12.0),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  border: Border.all(color: Theme.of(context).accentColor),
                ),
                padding: EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    orderCardItem(context,
                        title: "Items Purchased" + " (${widget.order['OrderDetails'].length})",
                        data: "PKR ${widget.order['OrderCheckouts']['AmountTotal'].toString()}"),
                    SizedBox(height: 12.0),
                    // orderCardItem(context,
                    //     title: "order.shipping",
                    //     data: "\$ ${order.shippingPrice}"),
                    // SizedBox(height: 12.0),
                    orderCardItem(context,
                        title: "Shipping Charges",
                        data: "PKR ${widget.order['OrderCheckouts']['ServiceCharges'].toString()}"),
                    SizedBox(height: 12.0),
                    priceItem(context,
                        title: "Total Price",
                        data: "PKR ${widget.order['OrderCheckouts']['AmountTotal'].toString()}"),
                  ],
                ),
              ),
              SizedBox(height: 15.0),
            ],
          ),
        ),
      ),
    );
  }

  Container productCard(BuildContext context, e) {
    //print(e);
    return Container();
    // return Container(
    //   width: double.infinity,
    //   height: 100.0,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(15.0),
    //     border: Border.all(color: Theme.of(context).accentColor),
    //   ),
    //   padding: EdgeInsets.all(12.0),
    //   margin: EdgeInsets.only(bottom: 8.0),
    //   child: Row(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: [
    //       ClipRRect(
    //         borderRadius: BorderRadius.circular(15.0),
    //         child: Image.asset(
    //           e.image,
    //           width: 80.0,
    //           height: 80.0,
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //       SizedBox(width: 12.0),
    //       Expanded(
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             Text(
    //               e.title,
    //               style: Theme.of(context).textTheme.headline4,
    //               maxLines: 2,
    //               overflow: TextOverflow.ellipsis,
    //             ),
    //             Spacer(),
    //             Text(
    //               "\$ ${e.normalPrice}",
    //               style: Theme.of(context)
    //                   .textTheme
    //                   .headline3
    //                   .copyWith(color: kPrimaryColor),
    //             ),
    //           ],
    //         ),
    //       ),
    //       IconButton(
    //         icon: Icon(
    //           Icons.favorite,
    //           color: 'ED4337'.toColor(),
    //         ),
    //         onPressed: () {},
    //       ),
    //     ],
    //   ),
    // );
  }

  Widget orderCardItem(BuildContext context, {String title, String data}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: Theme.of(context).textTheme.headline5).tr(),
        SizedBox(width: 60.0),
        Expanded(
          child: Text(data,
              textAlign: TextAlign.right,
              style: Theme.of(context).textTheme.subtitle2)
              .tr(),
        ),
      ],
    );
  }

  Widget priceItem(BuildContext context, {String title, String data}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.headline4).tr(),
        Text(data, style: Theme.of(context).textTheme.subtitle2),
      ],
    );
  }
}
