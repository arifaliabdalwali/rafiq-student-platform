class LevelModel {
  final int? id;
  final String name; // لا تقبل null

  // أضفنا required هنا لحل الخطأ الذي أرسلته
  LevelModel({this.id, required this.name});

  factory LevelModel.fromMap(Map<String, dynamic> json) => LevelModel(
        id: json['id'],
        name: json['name'] ?? '', // نضمن عدم وجود قيمة null
      );

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
      };
}