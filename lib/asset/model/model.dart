class Contact {
  int _id;
  String _name;
  String _phone;
  String _gaji;
  Contact(this._name, this._phone, this._gaji);

  Contact.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._phone = map['phone'];
    this._gaji = map['gaji'];
  }

  int get id => _id;
  String get name => _name;
  String get phone => _phone;
  String get gaji => _gaji;


  set name(String value) {
    _name = value;
  }

  set phone(String value) {
    _phone = value;
  }

  set gaji(String value) {
    _gaji = value;
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = Map<String, dynamic>();
    map['id'] = this._id;
    map['name'] = name;
    map['phone'] = phone;
    map['gaji'] = gaji;
    return map;
  }

}