
class Account {

  String? name;
  String? email;
  String? phone;
  String? password;
  String? confirmpassword;
  Account({this.name,this.email,this.password,this.phone,this.confirmpassword});
  Account.from({this.name, this.email,this.password,this.phone,this.confirmpassword});

  Account.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
  phone = json['phone'],
        password = json['password'],
  confirmpassword = json['confirmpassword'];
  Map<String, dynamic> toJson()=>{
    'name':name,
    'email':email,
    'phone':phone,
    'password':password,
    'confirmpassword':confirmpassword,
  };

}
