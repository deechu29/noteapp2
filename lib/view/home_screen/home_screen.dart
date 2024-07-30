import 'package:flutter/material.dart';
import 'package:noteapp2/dummydb.dart';
import 'package:noteapp2/view/widget/color_card.dart';
import 'package:noteapp2/view/widget/note_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController titlecontrol = TextEditingController();
  TextEditingController descriptioncontroll = TextEditingController();
  TextEditingController datecontroll = TextEditingController();
  int selectedColorindex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            selectedColorindex=0;
            titlecontrol.clear();
            descriptioncontroll.clear();
            datecontroll.clear();
            _customBottomsheet(context);
          },
          child: Icon(Icons.add),
        ),
        backgroundColor: Colors.black,
        body: ListView.separated(
            padding: EdgeInsets.all(10),
            itemBuilder: (context, index) => NoteCard(
                  title: titlecontrol.text,
                  description: descriptioncontroll.text,
                  date: datecontroll.text,
                  ondelete: () {
                    Dummydb.notelist.removeAt(index);
                    setState(() {});
                  },
                  onEditing: () {
                    titlecontrol.text = Dummydb.notelist[index]["title"];
                    descriptioncontroll.text =
                        Dummydb.notelist[index]["decription"];
                    datecontroll.text = Dummydb.notelist[index]["date"];
                    selectedColorindex = Dummydb.notelist[index]["colorindex"];

                    _customBottomsheet(context, isEdit: true);
                  },
                  textediting: () {},
                ),
            separatorBuilder: (context, index) => SizedBox(
                  height: 2,
                ),
            itemCount: Dummydb.notelist.length),
      ),
    );
  }

  Future<dynamic> _customBottomsheet(BuildContext context,
      {bool isEdit = false}) {
    return showModalBottomSheet(
      backgroundColor: Colors.grey.shade900,
      isScrollControlled: true,
      context: context,
      builder: (context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: titlecontrol,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      hintText: "title",
                      hintStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.grey)),
              SizedBox(
                height: 20,
              ),
              TextField(
                  maxLines: 5,
                  controller: descriptioncontroll,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      hintText: 'Description',
                      hintStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.grey)),
              SizedBox(
                height: 20,
              ),
              TextField(
                  controller: datecontroll,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      filled: true,
                      hintText: ' Date',
                      hintStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.grey)),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                    Dummydb.Colorcontainer.length,
                    (index) =>
                        ColorCard(colorkey: Dummydb.Colorcontainer[index])),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          "Cancel",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      width: 90,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Dummydb.notelist.add({
                        "title": titlecontrol.text,
                        "description": descriptioncontroll.text,
                        "date": datecontroll.text,
                      });
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: Text(
                          isEdit ? "update" : "save",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      width: 90,
                      height: 50,
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
