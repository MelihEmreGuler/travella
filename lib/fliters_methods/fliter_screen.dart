import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travella_01/information_page/constants.dart';

import '../welcome_page/ilgi_alani_kontrol_sayfasi.dart';
import 'ilgi_alanlari.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 100,),
          Text("  İlgi alanlarınızı seçiniz",
          style: Theme.of(context).textTheme.headline4!.copyWith(
            color: mainColor,
            ),
          ),
          CustomCategoryFilter(),
        ],
      ),
    );
  }
}

class CustomCategoryFilter extends StatefulWidget {

   CustomCategoryFilter({Key? key,}) : super(key: key);

  @override
  State<CustomCategoryFilter> createState() => _CustomCategoryFilterState();
}

class _CustomCategoryFilterState extends State<CustomCategoryFilter> {
  final List<String> filters = [
    "Yayla",
    "Şelale",
    "İnanç",
    "Kale",
    "Plaj",
    "Tarih",

  ];

  Map<String, bool> selectControl = {
    "Yayla" : false,
    "Şelale" : false,
    "İnanç" : false,
    "Kale": false,
    "Plaj": false,
    "Tarih": false,
  };

  List<bool> degerler = [
    false,
    false,
    false,
    false,
    false,
    false,
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListView.builder(
        shrinkWrap: true,
        itemCount: filters.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => setState((){degerler[index] = !degerler[index];}),
            child: Container(
              width:double.infinity,
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(horizontal: 30,vertical: 10),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(defaultBorderRadius)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(filters[index], style: Theme.of(context).textTheme.headline5,),
                  Icon( degerler[index] ? Icons.square_rounded : Icons.square_outlined ,color: mainColor,)
                ],
              ),
            ),
          );
        },
      ),
        ElevatedButton(
          onPressed: () {
            if(degerler[0]){
              IlgiAlanlari.ilgiAlanlari.add("Yayla");
              print("Yayla*************");
            }
            if(degerler[1]){
              IlgiAlanlari.ilgiAlanlari.add("Şelale");
              print("Şelale*************");
            }
            if(degerler[2]){
              IlgiAlanlari.ilgiAlanlari.add("İnanç");
              print("İnanç*************");
            }
            if(degerler[3]){
              IlgiAlanlari.ilgiAlanlari.add("Kale");
              print("Kale*************");
            }
            if(degerler[4]){
              IlgiAlanlari.ilgiAlanlari.add("Plaj");
              print("Plaj*************");
            }
            if(degerler[5]){
              IlgiAlanlari.ilgiAlanlari.add("Tarih");
              print("Tarih*************");
            }
            print(IlgiAlanlari.ilgiAlanlari);
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => ilgiAlaniKontrol(),));
          },
          style: ElevatedButton.styleFrom(
            primary: mainColor,
            shape: StadiumBorder(),
          ),
          child: Text(
            "Kaydet",
            style: TextStyle(
              fontSize: 23,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
/*
Checkbox(
                    activeColor: mainColor,
                    value: degerler[index],
                    onChanged: (value) => setState((){degerler[index] = !degerler[index];}),
                  )
 */
