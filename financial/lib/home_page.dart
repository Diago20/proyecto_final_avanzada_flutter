// ignore: depend_on_referenced_packages
import 'package:financial/transaction_model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isIncome = false;

  static const Color _primaryColor = Colors.deepPurpleAccent;
  static const Color _secondaryColor = Colors.deepOrangeAccent;

  final List<TransactionModel> _transactionList = [
    const TransactionModel(
      logo: 'assets/images/mcdonalds.png',
      name: "McDonald's",
      date: '22.02.2020',
      amount: '-22,50',
    ),
    const TransactionModel(
      logo: 'assets/images/gas-station.png',
      name: "Petrol",
      date: '22.02.2020',
      amount: '-75,45',
    ),
    const TransactionModel(
      logo: 'assets/images/mcdonalds.png',
      name: "McDonald's",
      date: '22.02.2020',
      amount: '-22,50',
    ),
    const TransactionModel(
      logo: 'assets/images/gas-station.png',
      name: "Petrol",
      date: '22.02.2020',
      amount: '-75,45',
    ),
  ];

  /// **********************************************
  /// LIFE CYCLE METHODS
  /// **********************************************

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Column(
        children: <Widget>[
          _appBarBottomSection(),
          _mainBody(),
        ],
      ),
    );
  }

  /// **********************************************
  /// WIDGETS
  /// **********************************************

  /// App Bar
  AppBar _buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: _primaryColor,
      leading: Padding(
        padding: const EdgeInsets.only(left: 20),
        child: IconButton(
          // ignore: avoid_print
          onPressed: () => print('Menu Tapped'),
          icon: Image.asset(
            'assets/images/menu.png',
            fit: BoxFit.fitWidth,
          ),
        ),
      ),
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: GestureDetector(
            // ignore: avoid_print
            onTap: () => print('Profile Tapped'),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: ClipOval(
                child: Image.asset(
                  'assets/images/profile.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  /// App Bar Bottom Section
  Container _appBarBottomSection() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 50),
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: _primaryColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Column(
        children: <Widget>[
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                '\$',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  height: 1,
                ),
              ),
              Text(
                '25,400',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w600,
                  height: 0.9,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            'Total Balance',
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 20,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              /// Income
              GestureDetector(
                onTap: () => setState(() {
                  _isIncome = !_isIncome;
                }),
                child: Text(
                  'Income',
                  style: TextStyle(
                    color: _isIncome ? _secondaryColor : Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
              ),

              /// Outcome
              GestureDetector(
                onTap: () => setState(() {
                  _isIncome = !_isIncome;
                }),
                child: Text(
                  'Outcome',
                  style: TextStyle(
                    color: _isIncome ? Colors.white : _secondaryColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    height: 1,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  /// Main Body
  Expanded _mainBody() {
    return Expanded(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
        physics: const ClampingScrollPhysics(),
        child: Column(
          children: <Widget>[
            _reportCell(
              isSavings: true,
              title: 'Savings Account',
              deposit: '\$5,450',
              rate: '+3,50%',
              progress: 25,
            ),
            const SizedBox(
              height: 16,
            ),
            _reportCell(
              isSavings: false,
              title: 'Financial Cushion',
              deposit: '\$12,350',
              rate: '+3,50%',
              progress: 50,
            ),
            const SizedBox(
              height: 32,
            ),
            Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        'Transactions',
                        style: TextStyle(
                          color: _primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        'All',
                        style: TextStyle(
                          color: _primaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                ListView.separated(
                  primary: false,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) => const Divider(),
                  itemCount: _transactionList.length,
                  itemBuilder: (context, index) => ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Container(
                      width: 60,
                      height: 60,
                      clipBehavior: Clip.hardEdge,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border:
                            Border.all(color: _primaryColor.withOpacity(0.1)),
                      ),
                      child: Image.asset(
                        _transactionList[index].logo,
                        fit: BoxFit.cover,
                        width: 30,
                        height: 30,
                      ),
                    ),
                    title: Text(
                      _transactionList[index].name,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Text(
                      _transactionList[index].date,
                      style: TextStyle(
                        color: _primaryColor.withOpacity(0.6),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    trailing: Text(
                      _transactionList[index].amount,
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /// Report Cell
  Container _reportCell({
    required bool isSavings,
    required String title,
    required String deposit,
    required String rate,
    required int progress,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      decoration: BoxDecoration(
        color: isSavings ? Colors.white : _secondaryColor,
        borderRadius: BorderRadius.circular(30),
        border: isSavings
            ? Border.all(color: _primaryColor.withOpacity(0.1), width: 2)
            : null,
        boxShadow: isSavings
            ? []
            : [
                BoxShadow(
                  color: _secondaryColor.withOpacity(0.4),
                  offset: const Offset(0, 8),
                  blurRadius: 10,
                ),
              ],
      ),
      child: Row(
        children: <Widget>[
          Stack(
            children: <Widget>[
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  value: progress / 100,
                  strokeWidth: 6,
                  backgroundColor: isSavings
                      ? _primaryColor.withOpacity(0.2)
                      : _primaryColor.withOpacity(0.1),
                  valueColor: AlwaysStoppedAnimation<Color>(
                      isSavings ? _secondaryColor : Colors.white),
                ),
              ),
              Container(
                width: 60,
                height: 60,
                alignment: Alignment.center,
                child: Text(
                  '$progress%',
                  style: TextStyle(
                    color: isSavings ? _primaryColor : Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            width: 30,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: TextStyle(
                  color: isSavings ? _primaryColor : Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: <Widget>[
                  _reportInnerCell(
                    isSavings: isSavings,
                    title: 'Deposit',
                    value: deposit,
                  ),
                  const SizedBox(
                    width: 24,
                  ),
                  _reportInnerCell(
                    isSavings: isSavings,
                    title: 'Rate',
                    value: rate,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Report Inner Cell
  Column _reportInnerCell({required bool isSavings, required String title, required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: TextStyle(
            color: isSavings ? _primaryColor.withOpacity(0.5) : Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          value,
          style: TextStyle(
            color: isSavings ? Colors.black87 : Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}
