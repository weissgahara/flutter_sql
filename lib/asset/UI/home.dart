import 'package:flutter/material.dart';
import 'package:fluttersql/asset/ui/form.dart';
import 'package:fluttersql/asset/model/model.dart';
import 'package:fluttersql/asset/helpers/hdatabase.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';


class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {

  DbHelper dbHelper = DbHelper();
  int count = 0;
  List<Contact> contactList;

  @override
  Widget build(BuildContext context) {
    if (contactList == null) {
      contactList = List<Contact>();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Daftar",
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 30.0,

          ),
        ),


      ),
      body: createListView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Tambah Data',
        onPressed: () async {
          var contact = await navigateToEntryForm(context, null);
          if (contact != null) addContact(contact);
        },
      ),
    );
  }

  Future<Contact> navigateToEntryForm(BuildContext context, Contact contact) async {
    var result = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) {
              return EntryForm(contact);
            }
        )
    );
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.subhead;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(Icons.person),
            ),
            title: Text(this.contactList[index].name, style: textStyle,),
            subtitle: Text(this.contactList[index].phone + ' | Rp.' + this.contactList[index].gaji),

            trailing: GestureDetector(
              child: Icon(Icons.delete_outline, color: Colors.redAccent,),
              onTap: () {
                deleteContact(contactList[index]);
              },
            ),
            onTap: () async {
              var contact = await navigateToEntryForm(context, this.contactList[index]);
              if (contact != null) editContact(contact);
            },
          ),
        );
      },
    );
  }

  void addContact(Contact object) async {
    int result = await dbHelper.insert(object);
    if (result > 0) {
      updateListView();
    }
  }

  void editContact(Contact object) async {
    int result = await dbHelper.update(object);
    if (result > 0) {
      updateListView();
    }
  }

  void deleteContact(Contact object) async {
    int result = await dbHelper.delete(object.id);
    if (result > 0) {
      updateListView();
    }
  }

  void updateListView() {
    final Future<Database> dbFuture = dbHelper.initDb();
    dbFuture.then((database) {
      Future<List<Contact>> contactListFuture = dbHelper.getContactList();
      contactListFuture.then((contactList) {
        setState(() {
          this.contactList = contactList;
          this.count = contactList.length;
        });
      });
    });
  }

}