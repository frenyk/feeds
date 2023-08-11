class UserModel {
  final String? id;
  final String fullname;
  final String email;
  final String password;
  final String phoneno;
  final String hostel;

  const UserModel(
    
    
    
    
    
     {this.id,required this.fullname, required this.email, required this.password, required this.phoneno, required this.hostel,}
  );
  toJson() {
    return {
      "Fullname": fullname,
      "Email": email,
      "Password": password,
      "PhoneNo": phoneno,
      "Hostel": hostel,
    };
  }
}
