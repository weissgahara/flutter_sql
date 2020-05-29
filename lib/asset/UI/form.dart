import 'package:flutter/material.dart';
import 'package:fluttersql/asset/model/model.dart';

class EntryForm extends StatefulWidget {
  final Contact contact;

  EntryForm(this.contact);

  @override
  EntryFormState createState() => EntryFormState(this.contact);
}
//class controller
class EntryFormState extends State<EntryForm> {
  Contact contact;

  EntryFormState(this.contact);

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController gajiController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    if (contact != null) {
      nameController.text = contact.name;
      phoneController.text = contact.phone;
      gajiController.text = contact.gaji;
    }

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: contact == null ? Text('Tambah Data',style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 30.0,
          ),)
              : Text('Edit'),
          leading: Icon(Icons.keyboard_arrow_left),

        ),

        body: Padding(
          padding: EdgeInsets.only(top: 15.0, left:10.0, right:10.0),
          child: ListView(
            children: <Widget> [
              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Nama Lengkap',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Telepon',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:20.0, bottom:20.0),
                child: TextField(
                  controller: gajiController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                    labelText: 'Gaji',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                  ),
                  onChanged: (value) {
                    //
                  },
                ),
              ),

              Padding (
                padding: EdgeInsets.only(top:10.0, bottom:10.0),
                child: Row(
                  children: <Widget> [
                    Expanded(
                      child: RaisedButton(
                        color: Colors.lightBlueAccent,
                        textColor: Colors.white,
                        child: Text(
                          'Save',
                          textScaleFactor: 1.5,
                        ),
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () {
                          if (contact == null) {
                            contact = Contact(nameController.text, phoneController.text, gajiController.text);
                          } else {
                            contact.name = nameController.text;
                            contact.phone = phoneController.text;
                            contact.gaji = gajiController.text;
                          }
                          Navigator.pop(context, contact);
                        },
                      ),
                    ),
                    Container(width: 5.0,),
                    // tombol batal
                    Expanded(
                      child: RaisedButton(
                        color: Colors.redAccent,
                        textColor: Colors.white,
                        child: Text(
                          'Cancel',
                          textScaleFactor: 1.5,
                        ),
                        shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        )
    );
  }
}