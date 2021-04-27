class AlternatifModel {
  final int id;
  final int a;

  AlternatifModel({this.id, this.a});
  Map<String, dynamic> toMap() {
    // used when inserting data to the database
    return <String, dynamic>{
      "id": id,
      "a": a,
    };
  }
}
