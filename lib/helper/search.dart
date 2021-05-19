import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:vendor_list/screens/company_list/model/company_list_response.dart';
import 'package:vendor_list/widgets/widgets.dart';

List<Company> myCom = [];

class DataSearch extends SearchDelegate<String> {
  final comapany = [
    "Al Jazeera Media Network",
    "Barwa Group",
    "BSI-Steel Building System Integration W.L.L",
    "GSSG Holding",
    "Gulf Drilling International",
    "Gulf Helicopters",
    "Hamad Medical Corporation",
    "Kahramaa",
    "Muntazah Oryx Investments",
    "Nakilat",
    "Nehmeh",
    "Ooredoo",
    "Oryx GTL",
    "Qatar Airways",
    "Qatar Amiri Flight",
    "Qatar Development Bank",
    "Qatar Exchange",
    "Qatar Executive",
    "Qatar Insurance",
    "QNB Group",
  ];

  final recent = [];
  @override
  List<Widget> buildActions(BuildContext context) {
    // List<String> list = [
    //   "None",
    //   "Home Automation",
    //   "Electricians",
    //   "Plumbing",
    //   "Design",
    //   "Elevator Mechanic",
    //   "Masonry Workers",
    //   "Carpenter ",
    //   " (PV) Installers",
    //   "Roofers "
    // ];
    // String dropdownValue="None";
    // TODO: implement buildActions
    return [
      // DropdownButton<String>(
      //
      // icon: const Icon(Icons.arrow_drop_down),
      // iconSize: 24,
      //
      // onChanged: (String newValue) {
      //
      // dropdownValue = newValue;
      // print(dropdownValue);
      //
      // },
      // items: list
      //     .map<DropdownMenuItem<String>>((String value) {
      // return DropdownMenuItem<String>(
      // value: value,
      // child: Text(value),
      // );
      // }).toList(),
      // ),

      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = "";
          }), // IconButton(icon: Icons.arrow_drop_down, onPressed: onPressed)
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    // myCom= CompanySearchRepository.getSearchedCompany(query);
    final suggestion = query.isEmpty
        ? recent
        : myCom.where((element) => element.name.contains(query)).toList();

    return ListView.builder(
      itemCount: suggestion.length,
      itemBuilder: (context, index) => Container(),

      //   cardButton(
      //
      //   context: context,
      //   company: myCom[index],
      //   // new Company(image: "",companyName: suggestion[index],ownerName: "Mohammad Bayzid",phoneNumber: "+974 55 91 45 36",firstLocation:"Media Tower" ,secondLocation: "Alrayan - Doha -Qatar",url:"www.mbayzid.com" ,email: "screens.info@mbayzid.com"),
      //   section: "Home",
      // s: false),
      //
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    final suggestion = query.isEmpty
        ? recent
        : myCom.where((element) => element.name.contains(query)).toList();

    return ListView.builder(
      itemCount: suggestion.length,
      itemBuilder: (context, index) => Container(),

//     cardButton(
//
//   context: context,
//   company:
//   // myCom[index],
//   new OldCompany(image: "",companyName: suggestion[index].companyName,ownerName: "Mohammad Bayzid",phoneNumber: "+974 55 91 45 36",firstLocation:"Media Tower" ,secondLocation: "Alrayan - Doha -Qatar",url:"www.mbayzid.com" ,email: "screens.info@mbayzid.com"),
//   section: "Home",
// s: false,),
    );
  }
}
