class User {
  final int? id;
  final String name; 
  final String email;
  final int? age;

  User({this.id,required this.name, required this.email, this.age});

  //konveriskan ke map untuk di sqllite 
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email':email, 
      'age': age
    };
  }

  //konversikan ke firestore 
  factory User.fromFireStore(Map<String, dynamic>data) {
    return User(
        id:  data['id'],
        name: data['name'], 
        email:data['email'], 
        age: data['age']
    );
  }
}
//disimpan di sqlite(data lokal ),, sinkronisasi firebase
