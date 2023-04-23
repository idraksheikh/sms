import 'package:flutter/material.dart';
import 'package:sms/Screens/widgets/spacer.dart';

class FeeInformation extends StatefulWidget {
  const FeeInformation({Key? key}) : super(key: key);

  @override
  FeeInformationState createState() => FeeInformationState();
}

class FeeInformationState extends State<FeeInformation> {
  String? name;
  double? admissionFees;
  double? cautionFees;
  double? busFees;
  double? tutionFees;
  double? totalFees;
  double? feesPaid;
  double? remainingFees;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      name = "Gurpreet Singh Bhatia";
      admissionFees = 5000;
      cautionFees = 5000;
      busFees = 15000;
      tutionFees = 25000;
      totalFees = admissionFees! + cautionFees! + busFees! + tutionFees!;
      feesPaid = 25000;
      remainingFees = totalFees! - feesPaid!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          const Space(height: 20,),
          Container(
            alignment: Alignment.topCenter,
            margin: const EdgeInsets.only(top: 40),
            child: const Text(
              'Fees Infomation',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.only(top: 40),
            color: Colors.white,
            elevation: 30,
            shadowColor: Colors.black,
            child: Container(
              height: 600,
              width: 320,
              padding: const EdgeInsets.all(30),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: 80,
                    width: 80,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile.jpg'),
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50.0))),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(name!),
                  const SizedBox(
                    height: 70,
                  ),
                  feeSection(context, "Admission Fees", admissionFees),
                  const SizedBox(
                    height: 20,
                  ),
                  feeSection(context, "Tution Fees", tutionFees),
                  const SizedBox(
                    height: 20,
                  ),
                  feeSection(context, "Caution Fees", cautionFees),
                  const SizedBox(
                    height: 20,
                  ),
                  feeSection(context, "Bus Fees", busFees),
                  const SizedBox(
                    height: 20,
                  ),
                
                  Divider(
                    color: Colors.lightGreen.shade400,
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  feeSection(context, "Total Fees", totalFees),
                  const SizedBox(
                    height: 20,
                  ),
                  feeSection(context, "Fees Paid", feesPaid),
                  const SizedBox(
                    height: 20,
                  ),
                 
                  Divider(
                    color: Colors.lightGreen.shade400,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  feeSection(context, "Remaining Fees", remainingFees),
                  const SizedBox(
                    height: 20,
                  ),
                 
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget feeSection(BuildContext context, String? feesType, double? amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Text(feesType!,textAlign: TextAlign.start,),
        
        Text('₹ ${amount!}',textAlign: TextAlign.end,),
      ],
    );
  }
}
