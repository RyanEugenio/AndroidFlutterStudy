
class Contact {

  int? id;
  String? name;
  String? email;
  String? phone;

  Contact({this.id, this.name, this.email, this.phone});

  /*
  id_column | name_column  |  email_column    |    phone_column
  1       "thiago"    "thiagocury@gmail.com"  51982092209
  2       "eduardo"    "eduardo@gmail.com"  51344525
  */

  //fromMap / toMap
  Contact.fromMap(Map<String, dynamic> map) {
    this.id = map['id_column']; //nome da coluna no banco de dados
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
    return 'Contact{id: $id, name: $name, email: $email, phone: $phone}';
  }

}