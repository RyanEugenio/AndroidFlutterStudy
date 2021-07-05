class Contact {

  int? id;
  String? name;
  String? email;
  String? phone;

  Contact({this.id, this.name, this.email, this.phone});

  Contact.fromMap(Map<String, dynamic> map) {
    this.id = map['id_column'];
    this.name = map['name_column'];
    this.email = map['email_column'];
    this.phone = map['phone_column'];
  }

  Map<String, Object?> toMap() {
    Map<String, Object?> map = {
      "name_column" : this.name,
      "email_column" : this.email,
      "phone_column" : this.phone,
    };
    if(id != null) {
      map['id_column'] = this.id;
    }
    return map;
  }

  @override
  String toString() {
    // TODO: implement toString
    return 'Contact{id: $id, name: $name, email: $email, phone: $phone}';
  }
}