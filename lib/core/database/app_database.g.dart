// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $UsersTable extends Users with TableInfo<$UsersTable, User> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UsersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
    'email',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'),
  );
  static const VerificationMeta _passwordMeta = const VerificationMeta(
    'password',
  );
  @override
  late final GeneratedColumn<String> password = GeneratedColumn<String>(
    'password',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _roleMeta = const VerificationMeta('role');
  @override
  late final GeneratedColumn<String> role = GeneratedColumn<String>(
    'role',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    email,
    password,
    role,
    createdAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'users';
  @override
  VerificationContext validateIntegrity(
    Insertable<User> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('email')) {
      context.handle(
        _emailMeta,
        email.isAcceptableOrUnknown(data['email']!, _emailMeta),
      );
    } else if (isInserting) {
      context.missing(_emailMeta);
    }
    if (data.containsKey('password')) {
      context.handle(
        _passwordMeta,
        password.isAcceptableOrUnknown(data['password']!, _passwordMeta),
      );
    } else if (isInserting) {
      context.missing(_passwordMeta);
    }
    if (data.containsKey('role')) {
      context.handle(
        _roleMeta,
        role.isAcceptableOrUnknown(data['role']!, _roleMeta),
      );
    } else if (isInserting) {
      context.missing(_roleMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  User map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return User(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      email: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}email'],
      )!,
      password: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}password'],
      )!,
      role: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}role'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $UsersTable createAlias(String alias) {
    return $UsersTable(attachedDatabase, alias);
  }
}

class User extends DataClass implements Insertable<User> {
  final int id;
  final String name;
  final String email;
  final String password;
  final String role;
  final DateTime createdAt;
  const User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.role,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['email'] = Variable<String>(email);
    map['password'] = Variable<String>(password);
    map['role'] = Variable<String>(role);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  UsersCompanion toCompanion(bool nullToAbsent) {
    return UsersCompanion(
      id: Value(id),
      name: Value(name),
      email: Value(email),
      password: Value(password),
      role: Value(role),
      createdAt: Value(createdAt),
    );
  }

  factory User.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return User(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      email: serializer.fromJson<String>(json['email']),
      password: serializer.fromJson<String>(json['password']),
      role: serializer.fromJson<String>(json['role']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'email': serializer.toJson<String>(email),
      'password': serializer.toJson<String>(password),
      'role': serializer.toJson<String>(role),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  User copyWith({
    int? id,
    String? name,
    String? email,
    String? password,
    String? role,
    DateTime? createdAt,
  }) => User(
    id: id ?? this.id,
    name: name ?? this.name,
    email: email ?? this.email,
    password: password ?? this.password,
    role: role ?? this.role,
    createdAt: createdAt ?? this.createdAt,
  );
  User copyWithCompanion(UsersCompanion data) {
    return User(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      email: data.email.present ? data.email.value : this.email,
      password: data.password.present ? data.password.value : this.password,
      role: data.role.present ? data.role.value : this.role,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('User(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('role: $role, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, email, password, role, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is User &&
          other.id == this.id &&
          other.name == this.name &&
          other.email == this.email &&
          other.password == this.password &&
          other.role == this.role &&
          other.createdAt == this.createdAt);
}

class UsersCompanion extends UpdateCompanion<User> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> email;
  final Value<String> password;
  final Value<String> role;
  final Value<DateTime> createdAt;
  const UsersCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.email = const Value.absent(),
    this.password = const Value.absent(),
    this.role = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  UsersCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String email,
    required String password,
    required String role,
    this.createdAt = const Value.absent(),
  }) : name = Value(name),
       email = Value(email),
       password = Value(password),
       role = Value(role);
  static Insertable<User> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? email,
    Expression<String>? password,
    Expression<String>? role,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (email != null) 'email': email,
      if (password != null) 'password': password,
      if (role != null) 'role': role,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  UsersCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? email,
    Value<String>? password,
    Value<String>? role,
    Value<DateTime>? createdAt,
  }) {
    return UsersCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (password.present) {
      map['password'] = Variable<String>(password.value);
    }
    if (role.present) {
      map['role'] = Variable<String>(role.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UsersCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('email: $email, ')
          ..write('password: $password, ')
          ..write('role: $role, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $LevelsTable extends Levels with TableInfo<$LevelsTable, Level> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LevelsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, description];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'levels';
  @override
  VerificationContext validateIntegrity(
    Insertable<Level> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Level map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Level(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
    );
  }

  @override
  $LevelsTable createAlias(String alias) {
    return $LevelsTable(attachedDatabase, alias);
  }
}

class Level extends DataClass implements Insertable<Level> {
  final int id;
  final String name;
  final String description;
  const Level({
    required this.id,
    required this.name,
    required this.description,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['description'] = Variable<String>(description);
    return map;
  }

  LevelsCompanion toCompanion(bool nullToAbsent) {
    return LevelsCompanion(
      id: Value(id),
      name: Value(name),
      description: Value(description),
    );
  }

  factory Level.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Level(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String>(json['description']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String>(description),
    };
  }

  Level copyWith({int? id, String? name, String? description}) => Level(
    id: id ?? this.id,
    name: name ?? this.name,
    description: description ?? this.description,
  );
  Level copyWithCompanion(LevelsCompanion data) {
    return Level(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description: data.description.present
          ? data.description.value
          : this.description,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Level(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, description);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Level &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description);
}

class LevelsCompanion extends UpdateCompanion<Level> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> description;
  const LevelsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
  });
  LevelsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.description = const Value.absent(),
  }) : name = Value(name);
  static Insertable<Level> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? description,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
    });
  }

  LevelsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? description,
  }) {
    return LevelsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LevelsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description')
          ..write(')'))
        .toString();
  }
}

class $StudentsTable extends Students with TableInfo<$StudentsTable, Student> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _currentLevelIdMeta = const VerificationMeta(
    'currentLevelId',
  );
  @override
  late final GeneratedColumn<int> currentLevelId = GeneratedColumn<int>(
    'current_level_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES levels (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId, currentLevelId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'students';
  @override
  VerificationContext validateIntegrity(
    Insertable<Student> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    if (data.containsKey('current_level_id')) {
      context.handle(
        _currentLevelIdMeta,
        currentLevelId.isAcceptableOrUnknown(
          data['current_level_id']!,
          _currentLevelIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentLevelIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Student map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Student(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
      currentLevelId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_level_id'],
      )!,
    );
  }

  @override
  $StudentsTable createAlias(String alias) {
    return $StudentsTable(attachedDatabase, alias);
  }
}

class Student extends DataClass implements Insertable<Student> {
  final int id;
  final int userId;
  final int currentLevelId;
  const Student({
    required this.id,
    required this.userId,
    required this.currentLevelId,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    map['current_level_id'] = Variable<int>(currentLevelId);
    return map;
  }

  StudentsCompanion toCompanion(bool nullToAbsent) {
    return StudentsCompanion(
      id: Value(id),
      userId: Value(userId),
      currentLevelId: Value(currentLevelId),
    );
  }

  factory Student.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Student(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
      currentLevelId: serializer.fromJson<int>(json['currentLevelId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
      'currentLevelId': serializer.toJson<int>(currentLevelId),
    };
  }

  Student copyWith({int? id, int? userId, int? currentLevelId}) => Student(
    id: id ?? this.id,
    userId: userId ?? this.userId,
    currentLevelId: currentLevelId ?? this.currentLevelId,
  );
  Student copyWithCompanion(StudentsCompanion data) {
    return Student(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
      currentLevelId: data.currentLevelId.present
          ? data.currentLevelId.value
          : this.currentLevelId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Student(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('currentLevelId: $currentLevelId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId, currentLevelId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Student &&
          other.id == this.id &&
          other.userId == this.userId &&
          other.currentLevelId == this.currentLevelId);
}

class StudentsCompanion extends UpdateCompanion<Student> {
  final Value<int> id;
  final Value<int> userId;
  final Value<int> currentLevelId;
  const StudentsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
    this.currentLevelId = const Value.absent(),
  });
  StudentsCompanion.insert({
    this.id = const Value.absent(),
    required int userId,
    required int currentLevelId,
  }) : userId = Value(userId),
       currentLevelId = Value(currentLevelId);
  static Insertable<Student> custom({
    Expression<int>? id,
    Expression<int>? userId,
    Expression<int>? currentLevelId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
      if (currentLevelId != null) 'current_level_id': currentLevelId,
    });
  }

  StudentsCompanion copyWith({
    Value<int>? id,
    Value<int>? userId,
    Value<int>? currentLevelId,
  }) {
    return StudentsCompanion(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      currentLevelId: currentLevelId ?? this.currentLevelId,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    if (currentLevelId.present) {
      map['current_level_id'] = Variable<int>(currentLevelId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId, ')
          ..write('currentLevelId: $currentLevelId')
          ..write(')'))
        .toString();
  }
}

class $AdminsTable extends Admins with TableInfo<$AdminsTable, Admin> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AdminsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _userIdMeta = const VerificationMeta('userId');
  @override
  late final GeneratedColumn<int> userId = GeneratedColumn<int>(
    'user_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES users (id) ON DELETE CASCADE',
    ),
  );
  @override
  List<GeneratedColumn> get $columns => [id, userId];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'admins';
  @override
  VerificationContext validateIntegrity(
    Insertable<Admin> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('user_id')) {
      context.handle(
        _userIdMeta,
        userId.isAcceptableOrUnknown(data['user_id']!, _userIdMeta),
      );
    } else if (isInserting) {
      context.missing(_userIdMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Admin map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Admin(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      userId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}user_id'],
      )!,
    );
  }

  @override
  $AdminsTable createAlias(String alias) {
    return $AdminsTable(attachedDatabase, alias);
  }
}

class Admin extends DataClass implements Insertable<Admin> {
  final int id;
  final int userId;
  const Admin({required this.id, required this.userId});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['user_id'] = Variable<int>(userId);
    return map;
  }

  AdminsCompanion toCompanion(bool nullToAbsent) {
    return AdminsCompanion(id: Value(id), userId: Value(userId));
  }

  factory Admin.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Admin(
      id: serializer.fromJson<int>(json['id']),
      userId: serializer.fromJson<int>(json['userId']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'userId': serializer.toJson<int>(userId),
    };
  }

  Admin copyWith({int? id, int? userId}) =>
      Admin(id: id ?? this.id, userId: userId ?? this.userId);
  Admin copyWithCompanion(AdminsCompanion data) {
    return Admin(
      id: data.id.present ? data.id.value : this.id,
      userId: data.userId.present ? data.userId.value : this.userId,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Admin(')
          ..write('id: $id, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, userId);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Admin && other.id == this.id && other.userId == this.userId);
}

class AdminsCompanion extends UpdateCompanion<Admin> {
  final Value<int> id;
  final Value<int> userId;
  const AdminsCompanion({
    this.id = const Value.absent(),
    this.userId = const Value.absent(),
  });
  AdminsCompanion.insert({this.id = const Value.absent(), required int userId})
    : userId = Value(userId);
  static Insertable<Admin> custom({
    Expression<int>? id,
    Expression<int>? userId,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (userId != null) 'user_id': userId,
    });
  }

  AdminsCompanion copyWith({Value<int>? id, Value<int>? userId}) {
    return AdminsCompanion(id: id ?? this.id, userId: userId ?? this.userId);
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (userId.present) {
      map['user_id'] = Variable<int>(userId.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AdminsCompanion(')
          ..write('id: $id, ')
          ..write('userId: $userId')
          ..write(')'))
        .toString();
  }
}

class $UnitsTable extends Units with TableInfo<$UnitsTable, Unit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $UnitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _levelIdMeta = const VerificationMeta(
    'levelId',
  );
  @override
  late final GeneratedColumn<int> levelId = GeneratedColumn<int>(
    'level_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES levels (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
    'number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, levelId, title, number];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'units';
  @override
  VerificationContext validateIntegrity(
    Insertable<Unit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('level_id')) {
      context.handle(
        _levelIdMeta,
        levelId.isAcceptableOrUnknown(data['level_id']!, _levelIdMeta),
      );
    } else if (isInserting) {
      context.missing(_levelIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Unit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Unit(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      levelId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}level_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number'],
      )!,
    );
  }

  @override
  $UnitsTable createAlias(String alias) {
    return $UnitsTable(attachedDatabase, alias);
  }
}

class Unit extends DataClass implements Insertable<Unit> {
  final int id;
  final int levelId;
  final String title;
  final int number;
  const Unit({
    required this.id,
    required this.levelId,
    required this.title,
    required this.number,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['level_id'] = Variable<int>(levelId);
    map['title'] = Variable<String>(title);
    map['number'] = Variable<int>(number);
    return map;
  }

  UnitsCompanion toCompanion(bool nullToAbsent) {
    return UnitsCompanion(
      id: Value(id),
      levelId: Value(levelId),
      title: Value(title),
      number: Value(number),
    );
  }

  factory Unit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Unit(
      id: serializer.fromJson<int>(json['id']),
      levelId: serializer.fromJson<int>(json['levelId']),
      title: serializer.fromJson<String>(json['title']),
      number: serializer.fromJson<int>(json['number']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'levelId': serializer.toJson<int>(levelId),
      'title': serializer.toJson<String>(title),
      'number': serializer.toJson<int>(number),
    };
  }

  Unit copyWith({int? id, int? levelId, String? title, int? number}) => Unit(
    id: id ?? this.id,
    levelId: levelId ?? this.levelId,
    title: title ?? this.title,
    number: number ?? this.number,
  );
  Unit copyWithCompanion(UnitsCompanion data) {
    return Unit(
      id: data.id.present ? data.id.value : this.id,
      levelId: data.levelId.present ? data.levelId.value : this.levelId,
      title: data.title.present ? data.title.value : this.title,
      number: data.number.present ? data.number.value : this.number,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Unit(')
          ..write('id: $id, ')
          ..write('levelId: $levelId, ')
          ..write('title: $title, ')
          ..write('number: $number')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, levelId, title, number);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Unit &&
          other.id == this.id &&
          other.levelId == this.levelId &&
          other.title == this.title &&
          other.number == this.number);
}

class UnitsCompanion extends UpdateCompanion<Unit> {
  final Value<int> id;
  final Value<int> levelId;
  final Value<String> title;
  final Value<int> number;
  const UnitsCompanion({
    this.id = const Value.absent(),
    this.levelId = const Value.absent(),
    this.title = const Value.absent(),
    this.number = const Value.absent(),
  });
  UnitsCompanion.insert({
    this.id = const Value.absent(),
    required int levelId,
    required String title,
    required int number,
  }) : levelId = Value(levelId),
       title = Value(title),
       number = Value(number);
  static Insertable<Unit> custom({
    Expression<int>? id,
    Expression<int>? levelId,
    Expression<String>? title,
    Expression<int>? number,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (levelId != null) 'level_id': levelId,
      if (title != null) 'title': title,
      if (number != null) 'number': number,
    });
  }

  UnitsCompanion copyWith({
    Value<int>? id,
    Value<int>? levelId,
    Value<String>? title,
    Value<int>? number,
  }) {
    return UnitsCompanion(
      id: id ?? this.id,
      levelId: levelId ?? this.levelId,
      title: title ?? this.title,
      number: number ?? this.number,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (levelId.present) {
      map['level_id'] = Variable<int>(levelId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('UnitsCompanion(')
          ..write('id: $id, ')
          ..write('levelId: $levelId, ')
          ..write('title: $title, ')
          ..write('number: $number')
          ..write(')'))
        .toString();
  }
}

class $LessonsTable extends Lessons with TableInfo<$LessonsTable, Lesson> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $LessonsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _unitIdMeta = const VerificationMeta('unitId');
  @override
  late final GeneratedColumn<int> unitId = GeneratedColumn<int>(
    'unit_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES units (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _numberMeta = const VerificationMeta('number');
  @override
  late final GeneratedColumn<int> number = GeneratedColumn<int>(
    'number',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _videoUrlMeta = const VerificationMeta(
    'videoUrl',
  );
  @override
  late final GeneratedColumn<String> videoUrl = GeneratedColumn<String>(
    'video_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [id, unitId, title, number, videoUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'lessons';
  @override
  VerificationContext validateIntegrity(
    Insertable<Lesson> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('unit_id')) {
      context.handle(
        _unitIdMeta,
        unitId.isAcceptableOrUnknown(data['unit_id']!, _unitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_unitIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('number')) {
      context.handle(
        _numberMeta,
        number.isAcceptableOrUnknown(data['number']!, _numberMeta),
      );
    } else if (isInserting) {
      context.missing(_numberMeta);
    }
    if (data.containsKey('video_url')) {
      context.handle(
        _videoUrlMeta,
        videoUrl.isAcceptableOrUnknown(data['video_url']!, _videoUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Lesson map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Lesson(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      unitId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}unit_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      number: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number'],
      )!,
      videoUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}video_url'],
      )!,
    );
  }

  @override
  $LessonsTable createAlias(String alias) {
    return $LessonsTable(attachedDatabase, alias);
  }
}

class Lesson extends DataClass implements Insertable<Lesson> {
  final int id;
  final int unitId;
  final String title;
  final int number;
  final String videoUrl;
  const Lesson({
    required this.id,
    required this.unitId,
    required this.title,
    required this.number,
    required this.videoUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['unit_id'] = Variable<int>(unitId);
    map['title'] = Variable<String>(title);
    map['number'] = Variable<int>(number);
    map['video_url'] = Variable<String>(videoUrl);
    return map;
  }

  LessonsCompanion toCompanion(bool nullToAbsent) {
    return LessonsCompanion(
      id: Value(id),
      unitId: Value(unitId),
      title: Value(title),
      number: Value(number),
      videoUrl: Value(videoUrl),
    );
  }

  factory Lesson.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Lesson(
      id: serializer.fromJson<int>(json['id']),
      unitId: serializer.fromJson<int>(json['unitId']),
      title: serializer.fromJson<String>(json['title']),
      number: serializer.fromJson<int>(json['number']),
      videoUrl: serializer.fromJson<String>(json['videoUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'unitId': serializer.toJson<int>(unitId),
      'title': serializer.toJson<String>(title),
      'number': serializer.toJson<int>(number),
      'videoUrl': serializer.toJson<String>(videoUrl),
    };
  }

  Lesson copyWith({
    int? id,
    int? unitId,
    String? title,
    int? number,
    String? videoUrl,
  }) => Lesson(
    id: id ?? this.id,
    unitId: unitId ?? this.unitId,
    title: title ?? this.title,
    number: number ?? this.number,
    videoUrl: videoUrl ?? this.videoUrl,
  );
  Lesson copyWithCompanion(LessonsCompanion data) {
    return Lesson(
      id: data.id.present ? data.id.value : this.id,
      unitId: data.unitId.present ? data.unitId.value : this.unitId,
      title: data.title.present ? data.title.value : this.title,
      number: data.number.present ? data.number.value : this.number,
      videoUrl: data.videoUrl.present ? data.videoUrl.value : this.videoUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Lesson(')
          ..write('id: $id, ')
          ..write('unitId: $unitId, ')
          ..write('title: $title, ')
          ..write('number: $number, ')
          ..write('videoUrl: $videoUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, unitId, title, number, videoUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Lesson &&
          other.id == this.id &&
          other.unitId == this.unitId &&
          other.title == this.title &&
          other.number == this.number &&
          other.videoUrl == this.videoUrl);
}

class LessonsCompanion extends UpdateCompanion<Lesson> {
  final Value<int> id;
  final Value<int> unitId;
  final Value<String> title;
  final Value<int> number;
  final Value<String> videoUrl;
  const LessonsCompanion({
    this.id = const Value.absent(),
    this.unitId = const Value.absent(),
    this.title = const Value.absent(),
    this.number = const Value.absent(),
    this.videoUrl = const Value.absent(),
  });
  LessonsCompanion.insert({
    this.id = const Value.absent(),
    required int unitId,
    required String title,
    required int number,
    this.videoUrl = const Value.absent(),
  }) : unitId = Value(unitId),
       title = Value(title),
       number = Value(number);
  static Insertable<Lesson> custom({
    Expression<int>? id,
    Expression<int>? unitId,
    Expression<String>? title,
    Expression<int>? number,
    Expression<String>? videoUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (unitId != null) 'unit_id': unitId,
      if (title != null) 'title': title,
      if (number != null) 'number': number,
      if (videoUrl != null) 'video_url': videoUrl,
    });
  }

  LessonsCompanion copyWith({
    Value<int>? id,
    Value<int>? unitId,
    Value<String>? title,
    Value<int>? number,
    Value<String>? videoUrl,
  }) {
    return LessonsCompanion(
      id: id ?? this.id,
      unitId: unitId ?? this.unitId,
      title: title ?? this.title,
      number: number ?? this.number,
      videoUrl: videoUrl ?? this.videoUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (unitId.present) {
      map['unit_id'] = Variable<int>(unitId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (number.present) {
      map['number'] = Variable<int>(number.value);
    }
    if (videoUrl.present) {
      map['video_url'] = Variable<String>(videoUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('LessonsCompanion(')
          ..write('id: $id, ')
          ..write('unitId: $unitId, ')
          ..write('title: $title, ')
          ..write('number: $number, ')
          ..write('videoUrl: $videoUrl')
          ..write(')'))
        .toString();
  }
}

class $VocabulariesTable extends Vocabularies
    with TableInfo<$VocabulariesTable, Vocabulary> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VocabulariesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _lessonIdMeta = const VerificationMeta(
    'lessonId',
  );
  @override
  late final GeneratedColumn<int> lessonId = GeneratedColumn<int>(
    'lesson_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES lessons (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
    'word',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _translationMeta = const VerificationMeta(
    'translation',
  );
  @override
  late final GeneratedColumn<String> translation = GeneratedColumn<String>(
    'translation',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _voiceUrlMeta = const VerificationMeta(
    'voiceUrl',
  );
  @override
  late final GeneratedColumn<String> voiceUrl = GeneratedColumn<String>(
    'voice_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    lessonId,
    word,
    translation,
    voiceUrl,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vocabularies';
  @override
  VerificationContext validateIntegrity(
    Insertable<Vocabulary> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('lesson_id')) {
      context.handle(
        _lessonIdMeta,
        lessonId.isAcceptableOrUnknown(data['lesson_id']!, _lessonIdMeta),
      );
    } else if (isInserting) {
      context.missing(_lessonIdMeta);
    }
    if (data.containsKey('word')) {
      context.handle(
        _wordMeta,
        word.isAcceptableOrUnknown(data['word']!, _wordMeta),
      );
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('translation')) {
      context.handle(
        _translationMeta,
        translation.isAcceptableOrUnknown(
          data['translation']!,
          _translationMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_translationMeta);
    }
    if (data.containsKey('voice_url')) {
      context.handle(
        _voiceUrlMeta,
        voiceUrl.isAcceptableOrUnknown(data['voice_url']!, _voiceUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Vocabulary map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Vocabulary(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      lessonId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}lesson_id'],
      )!,
      word: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}word'],
      )!,
      translation: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}translation'],
      )!,
      voiceUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}voice_url'],
      )!,
    );
  }

  @override
  $VocabulariesTable createAlias(String alias) {
    return $VocabulariesTable(attachedDatabase, alias);
  }
}

class Vocabulary extends DataClass implements Insertable<Vocabulary> {
  final int id;
  final int lessonId;
  final String word;
  final String translation;
  final String voiceUrl;
  const Vocabulary({
    required this.id,
    required this.lessonId,
    required this.word,
    required this.translation,
    required this.voiceUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['lesson_id'] = Variable<int>(lessonId);
    map['word'] = Variable<String>(word);
    map['translation'] = Variable<String>(translation);
    map['voice_url'] = Variable<String>(voiceUrl);
    return map;
  }

  VocabulariesCompanion toCompanion(bool nullToAbsent) {
    return VocabulariesCompanion(
      id: Value(id),
      lessonId: Value(lessonId),
      word: Value(word),
      translation: Value(translation),
      voiceUrl: Value(voiceUrl),
    );
  }

  factory Vocabulary.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Vocabulary(
      id: serializer.fromJson<int>(json['id']),
      lessonId: serializer.fromJson<int>(json['lessonId']),
      word: serializer.fromJson<String>(json['word']),
      translation: serializer.fromJson<String>(json['translation']),
      voiceUrl: serializer.fromJson<String>(json['voiceUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lessonId': serializer.toJson<int>(lessonId),
      'word': serializer.toJson<String>(word),
      'translation': serializer.toJson<String>(translation),
      'voiceUrl': serializer.toJson<String>(voiceUrl),
    };
  }

  Vocabulary copyWith({
    int? id,
    int? lessonId,
    String? word,
    String? translation,
    String? voiceUrl,
  }) => Vocabulary(
    id: id ?? this.id,
    lessonId: lessonId ?? this.lessonId,
    word: word ?? this.word,
    translation: translation ?? this.translation,
    voiceUrl: voiceUrl ?? this.voiceUrl,
  );
  Vocabulary copyWithCompanion(VocabulariesCompanion data) {
    return Vocabulary(
      id: data.id.present ? data.id.value : this.id,
      lessonId: data.lessonId.present ? data.lessonId.value : this.lessonId,
      word: data.word.present ? data.word.value : this.word,
      translation: data.translation.present
          ? data.translation.value
          : this.translation,
      voiceUrl: data.voiceUrl.present ? data.voiceUrl.value : this.voiceUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Vocabulary(')
          ..write('id: $id, ')
          ..write('lessonId: $lessonId, ')
          ..write('word: $word, ')
          ..write('translation: $translation, ')
          ..write('voiceUrl: $voiceUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, lessonId, word, translation, voiceUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Vocabulary &&
          other.id == this.id &&
          other.lessonId == this.lessonId &&
          other.word == this.word &&
          other.translation == this.translation &&
          other.voiceUrl == this.voiceUrl);
}

class VocabulariesCompanion extends UpdateCompanion<Vocabulary> {
  final Value<int> id;
  final Value<int> lessonId;
  final Value<String> word;
  final Value<String> translation;
  final Value<String> voiceUrl;
  const VocabulariesCompanion({
    this.id = const Value.absent(),
    this.lessonId = const Value.absent(),
    this.word = const Value.absent(),
    this.translation = const Value.absent(),
    this.voiceUrl = const Value.absent(),
  });
  VocabulariesCompanion.insert({
    this.id = const Value.absent(),
    required int lessonId,
    required String word,
    required String translation,
    this.voiceUrl = const Value.absent(),
  }) : lessonId = Value(lessonId),
       word = Value(word),
       translation = Value(translation);
  static Insertable<Vocabulary> custom({
    Expression<int>? id,
    Expression<int>? lessonId,
    Expression<String>? word,
    Expression<String>? translation,
    Expression<String>? voiceUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lessonId != null) 'lesson_id': lessonId,
      if (word != null) 'word': word,
      if (translation != null) 'translation': translation,
      if (voiceUrl != null) 'voice_url': voiceUrl,
    });
  }

  VocabulariesCompanion copyWith({
    Value<int>? id,
    Value<int>? lessonId,
    Value<String>? word,
    Value<String>? translation,
    Value<String>? voiceUrl,
  }) {
    return VocabulariesCompanion(
      id: id ?? this.id,
      lessonId: lessonId ?? this.lessonId,
      word: word ?? this.word,
      translation: translation ?? this.translation,
      voiceUrl: voiceUrl ?? this.voiceUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lessonId.present) {
      map['lesson_id'] = Variable<int>(lessonId.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (translation.present) {
      map['translation'] = Variable<String>(translation.value);
    }
    if (voiceUrl.present) {
      map['voice_url'] = Variable<String>(voiceUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VocabulariesCompanion(')
          ..write('id: $id, ')
          ..write('lessonId: $lessonId, ')
          ..write('word: $word, ')
          ..write('translation: $translation, ')
          ..write('voiceUrl: $voiceUrl')
          ..write(')'))
        .toString();
  }
}

class $QuizzesTable extends Quizzes with TableInfo<$QuizzesTable, Quizze> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuizzesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _lessonIdMeta = const VerificationMeta(
    'lessonId',
  );
  @override
  late final GeneratedColumn<int> lessonId = GeneratedColumn<int>(
    'lesson_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES lessons (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'title',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('Lesson_Quiz'),
  );
  static const VerificationMeta _durationMinutesMeta = const VerificationMeta(
    'durationMinutes',
  );
  @override
  late final GeneratedColumn<int> durationMinutes = GeneratedColumn<int>(
    'duration_minutes',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(10),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    lessonId,
    title,
    type,
    durationMinutes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'quizzes';
  @override
  VerificationContext validateIntegrity(
    Insertable<Quizze> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('lesson_id')) {
      context.handle(
        _lessonIdMeta,
        lessonId.isAcceptableOrUnknown(data['lesson_id']!, _lessonIdMeta),
      );
    } else if (isInserting) {
      context.missing(_lessonIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['title']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('duration_minutes')) {
      context.handle(
        _durationMinutesMeta,
        durationMinutes.isAcceptableOrUnknown(
          data['duration_minutes']!,
          _durationMinutesMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Quizze map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Quizze(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      lessonId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}lesson_id'],
      )!,
      title: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}title'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      durationMinutes: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}duration_minutes'],
      )!,
    );
  }

  @override
  $QuizzesTable createAlias(String alias) {
    return $QuizzesTable(attachedDatabase, alias);
  }
}

class Quizze extends DataClass implements Insertable<Quizze> {
  final int id;
  final int lessonId;
  final String title;
  final String type;
  final int durationMinutes;
  const Quizze({
    required this.id,
    required this.lessonId,
    required this.title,
    required this.type,
    required this.durationMinutes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['lesson_id'] = Variable<int>(lessonId);
    map['title'] = Variable<String>(title);
    map['type'] = Variable<String>(type);
    map['duration_minutes'] = Variable<int>(durationMinutes);
    return map;
  }

  QuizzesCompanion toCompanion(bool nullToAbsent) {
    return QuizzesCompanion(
      id: Value(id),
      lessonId: Value(lessonId),
      title: Value(title),
      type: Value(type),
      durationMinutes: Value(durationMinutes),
    );
  }

  factory Quizze.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Quizze(
      id: serializer.fromJson<int>(json['id']),
      lessonId: serializer.fromJson<int>(json['lessonId']),
      title: serializer.fromJson<String>(json['title']),
      type: serializer.fromJson<String>(json['type']),
      durationMinutes: serializer.fromJson<int>(json['durationMinutes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'lessonId': serializer.toJson<int>(lessonId),
      'title': serializer.toJson<String>(title),
      'type': serializer.toJson<String>(type),
      'durationMinutes': serializer.toJson<int>(durationMinutes),
    };
  }

  Quizze copyWith({
    int? id,
    int? lessonId,
    String? title,
    String? type,
    int? durationMinutes,
  }) => Quizze(
    id: id ?? this.id,
    lessonId: lessonId ?? this.lessonId,
    title: title ?? this.title,
    type: type ?? this.type,
    durationMinutes: durationMinutes ?? this.durationMinutes,
  );
  Quizze copyWithCompanion(QuizzesCompanion data) {
    return Quizze(
      id: data.id.present ? data.id.value : this.id,
      lessonId: data.lessonId.present ? data.lessonId.value : this.lessonId,
      title: data.title.present ? data.title.value : this.title,
      type: data.type.present ? data.type.value : this.type,
      durationMinutes: data.durationMinutes.present
          ? data.durationMinutes.value
          : this.durationMinutes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Quizze(')
          ..write('id: $id, ')
          ..write('lessonId: $lessonId, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('durationMinutes: $durationMinutes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, lessonId, title, type, durationMinutes);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Quizze &&
          other.id == this.id &&
          other.lessonId == this.lessonId &&
          other.title == this.title &&
          other.type == this.type &&
          other.durationMinutes == this.durationMinutes);
}

class QuizzesCompanion extends UpdateCompanion<Quizze> {
  final Value<int> id;
  final Value<int> lessonId;
  final Value<String> title;
  final Value<String> type;
  final Value<int> durationMinutes;
  const QuizzesCompanion({
    this.id = const Value.absent(),
    this.lessonId = const Value.absent(),
    this.title = const Value.absent(),
    this.type = const Value.absent(),
    this.durationMinutes = const Value.absent(),
  });
  QuizzesCompanion.insert({
    this.id = const Value.absent(),
    required int lessonId,
    required String title,
    this.type = const Value.absent(),
    this.durationMinutes = const Value.absent(),
  }) : lessonId = Value(lessonId),
       title = Value(title);
  static Insertable<Quizze> custom({
    Expression<int>? id,
    Expression<int>? lessonId,
    Expression<String>? title,
    Expression<String>? type,
    Expression<int>? durationMinutes,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (lessonId != null) 'lesson_id': lessonId,
      if (title != null) 'title': title,
      if (type != null) 'type': type,
      if (durationMinutes != null) 'duration_minutes': durationMinutes,
    });
  }

  QuizzesCompanion copyWith({
    Value<int>? id,
    Value<int>? lessonId,
    Value<String>? title,
    Value<String>? type,
    Value<int>? durationMinutes,
  }) {
    return QuizzesCompanion(
      id: id ?? this.id,
      lessonId: lessonId ?? this.lessonId,
      title: title ?? this.title,
      type: type ?? this.type,
      durationMinutes: durationMinutes ?? this.durationMinutes,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (lessonId.present) {
      map['lesson_id'] = Variable<int>(lessonId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (durationMinutes.present) {
      map['duration_minutes'] = Variable<int>(durationMinutes.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuizzesCompanion(')
          ..write('id: $id, ')
          ..write('lessonId: $lessonId, ')
          ..write('title: $title, ')
          ..write('type: $type, ')
          ..write('durationMinutes: $durationMinutes')
          ..write(')'))
        .toString();
  }
}

class $QuestionsTable extends Questions
    with TableInfo<$QuestionsTable, Question> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $QuestionsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _quizIdMeta = const VerificationMeta('quizId');
  @override
  late final GeneratedColumn<int> quizId = GeneratedColumn<int>(
    'quiz_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES quizzes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _questionTextMeta = const VerificationMeta(
    'questionText',
  );
  @override
  late final GeneratedColumn<String> questionText = GeneratedColumn<String>(
    'text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _imageUrlMeta = const VerificationMeta(
    'imageUrl',
  );
  @override
  late final GeneratedColumn<String> imageUrl = GeneratedColumn<String>(
    'image_url',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [id, quizId, questionText, imageUrl];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'questions';
  @override
  VerificationContext validateIntegrity(
    Insertable<Question> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('quiz_id')) {
      context.handle(
        _quizIdMeta,
        quizId.isAcceptableOrUnknown(data['quiz_id']!, _quizIdMeta),
      );
    } else if (isInserting) {
      context.missing(_quizIdMeta);
    }
    if (data.containsKey('text')) {
      context.handle(
        _questionTextMeta,
        questionText.isAcceptableOrUnknown(data['text']!, _questionTextMeta),
      );
    } else if (isInserting) {
      context.missing(_questionTextMeta);
    }
    if (data.containsKey('image_url')) {
      context.handle(
        _imageUrlMeta,
        imageUrl.isAcceptableOrUnknown(data['image_url']!, _imageUrlMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Question map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Question(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      quizId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quiz_id'],
      )!,
      questionText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text'],
      )!,
      imageUrl: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}image_url'],
      )!,
    );
  }

  @override
  $QuestionsTable createAlias(String alias) {
    return $QuestionsTable(attachedDatabase, alias);
  }
}

class Question extends DataClass implements Insertable<Question> {
  final int id;
  final int quizId;
  final String questionText;
  final String imageUrl;
  const Question({
    required this.id,
    required this.quizId,
    required this.questionText,
    required this.imageUrl,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['quiz_id'] = Variable<int>(quizId);
    map['text'] = Variable<String>(questionText);
    map['image_url'] = Variable<String>(imageUrl);
    return map;
  }

  QuestionsCompanion toCompanion(bool nullToAbsent) {
    return QuestionsCompanion(
      id: Value(id),
      quizId: Value(quizId),
      questionText: Value(questionText),
      imageUrl: Value(imageUrl),
    );
  }

  factory Question.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Question(
      id: serializer.fromJson<int>(json['id']),
      quizId: serializer.fromJson<int>(json['quizId']),
      questionText: serializer.fromJson<String>(json['questionText']),
      imageUrl: serializer.fromJson<String>(json['imageUrl']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'quizId': serializer.toJson<int>(quizId),
      'questionText': serializer.toJson<String>(questionText),
      'imageUrl': serializer.toJson<String>(imageUrl),
    };
  }

  Question copyWith({
    int? id,
    int? quizId,
    String? questionText,
    String? imageUrl,
  }) => Question(
    id: id ?? this.id,
    quizId: quizId ?? this.quizId,
    questionText: questionText ?? this.questionText,
    imageUrl: imageUrl ?? this.imageUrl,
  );
  Question copyWithCompanion(QuestionsCompanion data) {
    return Question(
      id: data.id.present ? data.id.value : this.id,
      quizId: data.quizId.present ? data.quizId.value : this.quizId,
      questionText: data.questionText.present
          ? data.questionText.value
          : this.questionText,
      imageUrl: data.imageUrl.present ? data.imageUrl.value : this.imageUrl,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Question(')
          ..write('id: $id, ')
          ..write('quizId: $quizId, ')
          ..write('questionText: $questionText, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, quizId, questionText, imageUrl);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Question &&
          other.id == this.id &&
          other.quizId == this.quizId &&
          other.questionText == this.questionText &&
          other.imageUrl == this.imageUrl);
}

class QuestionsCompanion extends UpdateCompanion<Question> {
  final Value<int> id;
  final Value<int> quizId;
  final Value<String> questionText;
  final Value<String> imageUrl;
  const QuestionsCompanion({
    this.id = const Value.absent(),
    this.quizId = const Value.absent(),
    this.questionText = const Value.absent(),
    this.imageUrl = const Value.absent(),
  });
  QuestionsCompanion.insert({
    this.id = const Value.absent(),
    required int quizId,
    required String questionText,
    this.imageUrl = const Value.absent(),
  }) : quizId = Value(quizId),
       questionText = Value(questionText);
  static Insertable<Question> custom({
    Expression<int>? id,
    Expression<int>? quizId,
    Expression<String>? questionText,
    Expression<String>? imageUrl,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (quizId != null) 'quiz_id': quizId,
      if (questionText != null) 'text': questionText,
      if (imageUrl != null) 'image_url': imageUrl,
    });
  }

  QuestionsCompanion copyWith({
    Value<int>? id,
    Value<int>? quizId,
    Value<String>? questionText,
    Value<String>? imageUrl,
  }) {
    return QuestionsCompanion(
      id: id ?? this.id,
      quizId: quizId ?? this.quizId,
      questionText: questionText ?? this.questionText,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (quizId.present) {
      map['quiz_id'] = Variable<int>(quizId.value);
    }
    if (questionText.present) {
      map['text'] = Variable<String>(questionText.value);
    }
    if (imageUrl.present) {
      map['image_url'] = Variable<String>(imageUrl.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('QuestionsCompanion(')
          ..write('id: $id, ')
          ..write('quizId: $quizId, ')
          ..write('questionText: $questionText, ')
          ..write('imageUrl: $imageUrl')
          ..write(')'))
        .toString();
  }
}

class $ChoicesTable extends Choices with TableInfo<$ChoicesTable, Choice> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ChoicesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _questionIdMeta = const VerificationMeta(
    'questionId',
  );
  @override
  late final GeneratedColumn<int> questionId = GeneratedColumn<int>(
    'question_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES questions (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _choiceTextMeta = const VerificationMeta(
    'choiceText',
  );
  @override
  late final GeneratedColumn<String> choiceText = GeneratedColumn<String>(
    'text',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isCorrectMeta = const VerificationMeta(
    'isCorrect',
  );
  @override
  late final GeneratedColumn<bool> isCorrect = GeneratedColumn<bool>(
    'is_correct',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_correct" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, questionId, choiceText, isCorrect];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'choices';
  @override
  VerificationContext validateIntegrity(
    Insertable<Choice> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('question_id')) {
      context.handle(
        _questionIdMeta,
        questionId.isAcceptableOrUnknown(data['question_id']!, _questionIdMeta),
      );
    } else if (isInserting) {
      context.missing(_questionIdMeta);
    }
    if (data.containsKey('text')) {
      context.handle(
        _choiceTextMeta,
        choiceText.isAcceptableOrUnknown(data['text']!, _choiceTextMeta),
      );
    } else if (isInserting) {
      context.missing(_choiceTextMeta);
    }
    if (data.containsKey('is_correct')) {
      context.handle(
        _isCorrectMeta,
        isCorrect.isAcceptableOrUnknown(data['is_correct']!, _isCorrectMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Choice map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Choice(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      questionId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}question_id'],
      )!,
      choiceText: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}text'],
      )!,
      isCorrect: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_correct'],
      )!,
    );
  }

  @override
  $ChoicesTable createAlias(String alias) {
    return $ChoicesTable(attachedDatabase, alias);
  }
}

class Choice extends DataClass implements Insertable<Choice> {
  final int id;
  final int questionId;
  final String choiceText;
  final bool isCorrect;
  const Choice({
    required this.id,
    required this.questionId,
    required this.choiceText,
    required this.isCorrect,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['question_id'] = Variable<int>(questionId);
    map['text'] = Variable<String>(choiceText);
    map['is_correct'] = Variable<bool>(isCorrect);
    return map;
  }

  ChoicesCompanion toCompanion(bool nullToAbsent) {
    return ChoicesCompanion(
      id: Value(id),
      questionId: Value(questionId),
      choiceText: Value(choiceText),
      isCorrect: Value(isCorrect),
    );
  }

  factory Choice.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Choice(
      id: serializer.fromJson<int>(json['id']),
      questionId: serializer.fromJson<int>(json['questionId']),
      choiceText: serializer.fromJson<String>(json['choiceText']),
      isCorrect: serializer.fromJson<bool>(json['isCorrect']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'questionId': serializer.toJson<int>(questionId),
      'choiceText': serializer.toJson<String>(choiceText),
      'isCorrect': serializer.toJson<bool>(isCorrect),
    };
  }

  Choice copyWith({
    int? id,
    int? questionId,
    String? choiceText,
    bool? isCorrect,
  }) => Choice(
    id: id ?? this.id,
    questionId: questionId ?? this.questionId,
    choiceText: choiceText ?? this.choiceText,
    isCorrect: isCorrect ?? this.isCorrect,
  );
  Choice copyWithCompanion(ChoicesCompanion data) {
    return Choice(
      id: data.id.present ? data.id.value : this.id,
      questionId: data.questionId.present
          ? data.questionId.value
          : this.questionId,
      choiceText: data.choiceText.present
          ? data.choiceText.value
          : this.choiceText,
      isCorrect: data.isCorrect.present ? data.isCorrect.value : this.isCorrect,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Choice(')
          ..write('id: $id, ')
          ..write('questionId: $questionId, ')
          ..write('choiceText: $choiceText, ')
          ..write('isCorrect: $isCorrect')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, questionId, choiceText, isCorrect);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Choice &&
          other.id == this.id &&
          other.questionId == this.questionId &&
          other.choiceText == this.choiceText &&
          other.isCorrect == this.isCorrect);
}

class ChoicesCompanion extends UpdateCompanion<Choice> {
  final Value<int> id;
  final Value<int> questionId;
  final Value<String> choiceText;
  final Value<bool> isCorrect;
  const ChoicesCompanion({
    this.id = const Value.absent(),
    this.questionId = const Value.absent(),
    this.choiceText = const Value.absent(),
    this.isCorrect = const Value.absent(),
  });
  ChoicesCompanion.insert({
    this.id = const Value.absent(),
    required int questionId,
    required String choiceText,
    this.isCorrect = const Value.absent(),
  }) : questionId = Value(questionId),
       choiceText = Value(choiceText);
  static Insertable<Choice> custom({
    Expression<int>? id,
    Expression<int>? questionId,
    Expression<String>? choiceText,
    Expression<bool>? isCorrect,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (questionId != null) 'question_id': questionId,
      if (choiceText != null) 'text': choiceText,
      if (isCorrect != null) 'is_correct': isCorrect,
    });
  }

  ChoicesCompanion copyWith({
    Value<int>? id,
    Value<int>? questionId,
    Value<String>? choiceText,
    Value<bool>? isCorrect,
  }) {
    return ChoicesCompanion(
      id: id ?? this.id,
      questionId: questionId ?? this.questionId,
      choiceText: choiceText ?? this.choiceText,
      isCorrect: isCorrect ?? this.isCorrect,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (questionId.present) {
      map['question_id'] = Variable<int>(questionId.value);
    }
    if (choiceText.present) {
      map['text'] = Variable<String>(choiceText.value);
    }
    if (isCorrect.present) {
      map['is_correct'] = Variable<bool>(isCorrect.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ChoicesCompanion(')
          ..write('id: $id, ')
          ..write('questionId: $questionId, ')
          ..write('choiceText: $choiceText, ')
          ..write('isCorrect: $isCorrect')
          ..write(')'))
        .toString();
  }
}

class $StudentGradesTable extends StudentGrades
    with TableInfo<$StudentGradesTable, StudentGrade> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $StudentGradesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _studentIdMeta = const VerificationMeta(
    'studentId',
  );
  @override
  late final GeneratedColumn<int> studentId = GeneratedColumn<int>(
    'student_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES students (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _quizIdMeta = const VerificationMeta('quizId');
  @override
  late final GeneratedColumn<int> quizId = GeneratedColumn<int>(
    'quiz_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES quizzes (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _scoreMeta = const VerificationMeta('score');
  @override
  late final GeneratedColumn<int> score = GeneratedColumn<int>(
    'score',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _takenAtMeta = const VerificationMeta(
    'takenAt',
  );
  @override
  late final GeneratedColumn<DateTime> takenAt = GeneratedColumn<DateTime>(
    'taken_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [id, studentId, quizId, score, takenAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'student_grades';
  @override
  VerificationContext validateIntegrity(
    Insertable<StudentGrade> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('student_id')) {
      context.handle(
        _studentIdMeta,
        studentId.isAcceptableOrUnknown(data['student_id']!, _studentIdMeta),
      );
    } else if (isInserting) {
      context.missing(_studentIdMeta);
    }
    if (data.containsKey('quiz_id')) {
      context.handle(
        _quizIdMeta,
        quizId.isAcceptableOrUnknown(data['quiz_id']!, _quizIdMeta),
      );
    } else if (isInserting) {
      context.missing(_quizIdMeta);
    }
    if (data.containsKey('score')) {
      context.handle(
        _scoreMeta,
        score.isAcceptableOrUnknown(data['score']!, _scoreMeta),
      );
    } else if (isInserting) {
      context.missing(_scoreMeta);
    }
    if (data.containsKey('taken_at')) {
      context.handle(
        _takenAtMeta,
        takenAt.isAcceptableOrUnknown(data['taken_at']!, _takenAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  StudentGrade map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return StudentGrade(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      studentId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}student_id'],
      )!,
      quizId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}quiz_id'],
      )!,
      score: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}score'],
      )!,
      takenAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}taken_at'],
      )!,
    );
  }

  @override
  $StudentGradesTable createAlias(String alias) {
    return $StudentGradesTable(attachedDatabase, alias);
  }
}

class StudentGrade extends DataClass implements Insertable<StudentGrade> {
  final int id;
  final int studentId;
  final int quizId;
  final int score;
  final DateTime takenAt;
  const StudentGrade({
    required this.id,
    required this.studentId,
    required this.quizId,
    required this.score,
    required this.takenAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['student_id'] = Variable<int>(studentId);
    map['quiz_id'] = Variable<int>(quizId);
    map['score'] = Variable<int>(score);
    map['taken_at'] = Variable<DateTime>(takenAt);
    return map;
  }

  StudentGradesCompanion toCompanion(bool nullToAbsent) {
    return StudentGradesCompanion(
      id: Value(id),
      studentId: Value(studentId),
      quizId: Value(quizId),
      score: Value(score),
      takenAt: Value(takenAt),
    );
  }

  factory StudentGrade.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return StudentGrade(
      id: serializer.fromJson<int>(json['id']),
      studentId: serializer.fromJson<int>(json['studentId']),
      quizId: serializer.fromJson<int>(json['quizId']),
      score: serializer.fromJson<int>(json['score']),
      takenAt: serializer.fromJson<DateTime>(json['takenAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'studentId': serializer.toJson<int>(studentId),
      'quizId': serializer.toJson<int>(quizId),
      'score': serializer.toJson<int>(score),
      'takenAt': serializer.toJson<DateTime>(takenAt),
    };
  }

  StudentGrade copyWith({
    int? id,
    int? studentId,
    int? quizId,
    int? score,
    DateTime? takenAt,
  }) => StudentGrade(
    id: id ?? this.id,
    studentId: studentId ?? this.studentId,
    quizId: quizId ?? this.quizId,
    score: score ?? this.score,
    takenAt: takenAt ?? this.takenAt,
  );
  StudentGrade copyWithCompanion(StudentGradesCompanion data) {
    return StudentGrade(
      id: data.id.present ? data.id.value : this.id,
      studentId: data.studentId.present ? data.studentId.value : this.studentId,
      quizId: data.quizId.present ? data.quizId.value : this.quizId,
      score: data.score.present ? data.score.value : this.score,
      takenAt: data.takenAt.present ? data.takenAt.value : this.takenAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('StudentGrade(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('quizId: $quizId, ')
          ..write('score: $score, ')
          ..write('takenAt: $takenAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, studentId, quizId, score, takenAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is StudentGrade &&
          other.id == this.id &&
          other.studentId == this.studentId &&
          other.quizId == this.quizId &&
          other.score == this.score &&
          other.takenAt == this.takenAt);
}

class StudentGradesCompanion extends UpdateCompanion<StudentGrade> {
  final Value<int> id;
  final Value<int> studentId;
  final Value<int> quizId;
  final Value<int> score;
  final Value<DateTime> takenAt;
  const StudentGradesCompanion({
    this.id = const Value.absent(),
    this.studentId = const Value.absent(),
    this.quizId = const Value.absent(),
    this.score = const Value.absent(),
    this.takenAt = const Value.absent(),
  });
  StudentGradesCompanion.insert({
    this.id = const Value.absent(),
    required int studentId,
    required int quizId,
    required int score,
    this.takenAt = const Value.absent(),
  }) : studentId = Value(studentId),
       quizId = Value(quizId),
       score = Value(score);
  static Insertable<StudentGrade> custom({
    Expression<int>? id,
    Expression<int>? studentId,
    Expression<int>? quizId,
    Expression<int>? score,
    Expression<DateTime>? takenAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (studentId != null) 'student_id': studentId,
      if (quizId != null) 'quiz_id': quizId,
      if (score != null) 'score': score,
      if (takenAt != null) 'taken_at': takenAt,
    });
  }

  StudentGradesCompanion copyWith({
    Value<int>? id,
    Value<int>? studentId,
    Value<int>? quizId,
    Value<int>? score,
    Value<DateTime>? takenAt,
  }) {
    return StudentGradesCompanion(
      id: id ?? this.id,
      studentId: studentId ?? this.studentId,
      quizId: quizId ?? this.quizId,
      score: score ?? this.score,
      takenAt: takenAt ?? this.takenAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (studentId.present) {
      map['student_id'] = Variable<int>(studentId.value);
    }
    if (quizId.present) {
      map['quiz_id'] = Variable<int>(quizId.value);
    }
    if (score.present) {
      map['score'] = Variable<int>(score.value);
    }
    if (takenAt.present) {
      map['taken_at'] = Variable<DateTime>(takenAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('StudentGradesCompanion(')
          ..write('id: $id, ')
          ..write('studentId: $studentId, ')
          ..write('quizId: $quizId, ')
          ..write('score: $score, ')
          ..write('takenAt: $takenAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $UsersTable users = $UsersTable(this);
  late final $LevelsTable levels = $LevelsTable(this);
  late final $StudentsTable students = $StudentsTable(this);
  late final $AdminsTable admins = $AdminsTable(this);
  late final $UnitsTable units = $UnitsTable(this);
  late final $LessonsTable lessons = $LessonsTable(this);
  late final $VocabulariesTable vocabularies = $VocabulariesTable(this);
  late final $QuizzesTable quizzes = $QuizzesTable(this);
  late final $QuestionsTable questions = $QuestionsTable(this);
  late final $ChoicesTable choices = $ChoicesTable(this);
  late final $StudentGradesTable studentGrades = $StudentGradesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    users,
    levels,
    students,
    admins,
    units,
    lessons,
    vocabularies,
    quizzes,
    questions,
    choices,
    studentGrades,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('students', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'levels',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('students', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'users',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('admins', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'levels',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('units', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'units',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('lessons', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'lessons',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('vocabularies', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'lessons',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('quizzes', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'quizzes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('questions', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'questions',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('choices', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'students',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('student_grades', kind: UpdateKind.delete)],
    ),
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'quizzes',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('student_grades', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$UsersTableCreateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      required String name,
      required String email,
      required String password,
      required String role,
      Value<DateTime> createdAt,
    });
typedef $$UsersTableUpdateCompanionBuilder =
    UsersCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> email,
      Value<String> password,
      Value<String> role,
      Value<DateTime> createdAt,
    });

final class $$UsersTableReferences
    extends BaseReferences<_$AppDatabase, $UsersTable, User> {
  $$UsersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$StudentsTable, List<Student>> _studentsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.students,
    aliasName: $_aliasNameGenerator(db.users.id, db.students.userId),
  );

  $$StudentsTableProcessedTableManager get studentsRefs {
    final manager = $$StudentsTableTableManager(
      $_db,
      $_db.students,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_studentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$AdminsTable, List<Admin>> _adminsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.admins,
    aliasName: $_aliasNameGenerator(db.users.id, db.admins.userId),
  );

  $$AdminsTableProcessedTableManager get adminsRefs {
    final manager = $$AdminsTableTableManager(
      $_db,
      $_db.admins,
    ).filter((f) => f.userId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_adminsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UsersTableFilterComposer extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> studentsRefs(
    Expression<bool> Function($$StudentsTableFilterComposer f) f,
  ) {
    final $$StudentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableFilterComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> adminsRefs(
    Expression<bool> Function($$AdminsTableFilterComposer f) f,
  ) {
    final $$AdminsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.admins,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdminsTableFilterComposer(
            $db: $db,
            $table: $db.admins,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableOrderingComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get email => $composableBuilder(
    column: $table.email,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get password => $composableBuilder(
    column: $table.password,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get role => $composableBuilder(
    column: $table.role,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$UsersTableAnnotationComposer
    extends Composer<_$AppDatabase, $UsersTable> {
  $$UsersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get password =>
      $composableBuilder(column: $table.password, builder: (column) => column);

  GeneratedColumn<String> get role =>
      $composableBuilder(column: $table.role, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> studentsRefs<T extends Object>(
    Expression<T> Function($$StudentsTableAnnotationComposer a) f,
  ) {
    final $$StudentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableAnnotationComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> adminsRefs<T extends Object>(
    Expression<T> Function($$AdminsTableAnnotationComposer a) f,
  ) {
    final $$AdminsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.admins,
      getReferencedColumn: (t) => t.userId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$AdminsTableAnnotationComposer(
            $db: $db,
            $table: $db.admins,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UsersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UsersTable,
          User,
          $$UsersTableFilterComposer,
          $$UsersTableOrderingComposer,
          $$UsersTableAnnotationComposer,
          $$UsersTableCreateCompanionBuilder,
          $$UsersTableUpdateCompanionBuilder,
          (User, $$UsersTableReferences),
          User,
          PrefetchHooks Function({bool studentsRefs, bool adminsRefs})
        > {
  $$UsersTableTableManager(_$AppDatabase db, $UsersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UsersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UsersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UsersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> email = const Value.absent(),
                Value<String> password = const Value.absent(),
                Value<String> role = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => UsersCompanion(
                id: id,
                name: name,
                email: email,
                password: password,
                role: role,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String email,
                required String password,
                required String role,
                Value<DateTime> createdAt = const Value.absent(),
              }) => UsersCompanion.insert(
                id: id,
                name: name,
                email: email,
                password: password,
                role: role,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UsersTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({studentsRefs = false, adminsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (studentsRefs) db.students,
                if (adminsRefs) db.admins,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (studentsRefs)
                    await $_getPrefetchedData<User, $UsersTable, Student>(
                      currentTable: table,
                      referencedTable: $$UsersTableReferences
                          ._studentsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$UsersTableReferences(db, table, p0).studentsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.userId == item.id),
                      typedResults: items,
                    ),
                  if (adminsRefs)
                    await $_getPrefetchedData<User, $UsersTable, Admin>(
                      currentTable: table,
                      referencedTable: $$UsersTableReferences._adminsRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$UsersTableReferences(db, table, p0).adminsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.userId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UsersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UsersTable,
      User,
      $$UsersTableFilterComposer,
      $$UsersTableOrderingComposer,
      $$UsersTableAnnotationComposer,
      $$UsersTableCreateCompanionBuilder,
      $$UsersTableUpdateCompanionBuilder,
      (User, $$UsersTableReferences),
      User,
      PrefetchHooks Function({bool studentsRefs, bool adminsRefs})
    >;
typedef $$LevelsTableCreateCompanionBuilder =
    LevelsCompanion Function({
      Value<int> id,
      required String name,
      Value<String> description,
    });
typedef $$LevelsTableUpdateCompanionBuilder =
    LevelsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> description,
    });

final class $$LevelsTableReferences
    extends BaseReferences<_$AppDatabase, $LevelsTable, Level> {
  $$LevelsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$StudentsTable, List<Student>> _studentsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.students,
    aliasName: $_aliasNameGenerator(db.levels.id, db.students.currentLevelId),
  );

  $$StudentsTableProcessedTableManager get studentsRefs {
    final manager = $$StudentsTableTableManager(
      $_db,
      $_db.students,
    ).filter((f) => f.currentLevelId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_studentsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$UnitsTable, List<Unit>> _unitsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.units,
    aliasName: $_aliasNameGenerator(db.levels.id, db.units.levelId),
  );

  $$UnitsTableProcessedTableManager get unitsRefs {
    final manager = $$UnitsTableTableManager(
      $_db,
      $_db.units,
    ).filter((f) => f.levelId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_unitsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LevelsTableFilterComposer
    extends Composer<_$AppDatabase, $LevelsTable> {
  $$LevelsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> studentsRefs(
    Expression<bool> Function($$StudentsTableFilterComposer f) f,
  ) {
    final $$StudentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.currentLevelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableFilterComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> unitsRefs(
    Expression<bool> Function($$UnitsTableFilterComposer f) f,
  ) {
    final $$UnitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.levelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableFilterComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LevelsTableOrderingComposer
    extends Composer<_$AppDatabase, $LevelsTable> {
  $$LevelsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$LevelsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LevelsTable> {
  $$LevelsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  Expression<T> studentsRefs<T extends Object>(
    Expression<T> Function($$StudentsTableAnnotationComposer a) f,
  ) {
    final $$StudentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.currentLevelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableAnnotationComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> unitsRefs<T extends Object>(
    Expression<T> Function($$UnitsTableAnnotationComposer a) f,
  ) {
    final $$UnitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.levelId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableAnnotationComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LevelsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LevelsTable,
          Level,
          $$LevelsTableFilterComposer,
          $$LevelsTableOrderingComposer,
          $$LevelsTableAnnotationComposer,
          $$LevelsTableCreateCompanionBuilder,
          $$LevelsTableUpdateCompanionBuilder,
          (Level, $$LevelsTableReferences),
          Level,
          PrefetchHooks Function({bool studentsRefs, bool unitsRefs})
        > {
  $$LevelsTableTableManager(_$AppDatabase db, $LevelsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LevelsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LevelsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LevelsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> description = const Value.absent(),
              }) =>
                  LevelsCompanion(id: id, name: name, description: description),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                Value<String> description = const Value.absent(),
              }) => LevelsCompanion.insert(
                id: id,
                name: name,
                description: description,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$LevelsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({studentsRefs = false, unitsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (studentsRefs) db.students,
                if (unitsRefs) db.units,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (studentsRefs)
                    await $_getPrefetchedData<Level, $LevelsTable, Student>(
                      currentTable: table,
                      referencedTable: $$LevelsTableReferences
                          ._studentsRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$LevelsTableReferences(db, table, p0).studentsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.currentLevelId == item.id,
                          ),
                      typedResults: items,
                    ),
                  if (unitsRefs)
                    await $_getPrefetchedData<Level, $LevelsTable, Unit>(
                      currentTable: table,
                      referencedTable: $$LevelsTableReferences._unitsRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$LevelsTableReferences(db, table, p0).unitsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.levelId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$LevelsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LevelsTable,
      Level,
      $$LevelsTableFilterComposer,
      $$LevelsTableOrderingComposer,
      $$LevelsTableAnnotationComposer,
      $$LevelsTableCreateCompanionBuilder,
      $$LevelsTableUpdateCompanionBuilder,
      (Level, $$LevelsTableReferences),
      Level,
      PrefetchHooks Function({bool studentsRefs, bool unitsRefs})
    >;
typedef $$StudentsTableCreateCompanionBuilder =
    StudentsCompanion Function({
      Value<int> id,
      required int userId,
      required int currentLevelId,
    });
typedef $$StudentsTableUpdateCompanionBuilder =
    StudentsCompanion Function({
      Value<int> id,
      Value<int> userId,
      Value<int> currentLevelId,
    });

final class $$StudentsTableReferences
    extends BaseReferences<_$AppDatabase, $StudentsTable, Student> {
  $$StudentsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) => db.users.createAlias(
    $_aliasNameGenerator(db.students.userId, db.users.id),
  );

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $LevelsTable _currentLevelIdTable(_$AppDatabase db) =>
      db.levels.createAlias(
        $_aliasNameGenerator(db.students.currentLevelId, db.levels.id),
      );

  $$LevelsTableProcessedTableManager get currentLevelId {
    final $_column = $_itemColumn<int>('current_level_id')!;

    final manager = $$LevelsTableTableManager(
      $_db,
      $_db.levels,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_currentLevelIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$StudentGradesTable, List<StudentGrade>>
  _studentGradesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.studentGrades,
    aliasName: $_aliasNameGenerator(db.students.id, db.studentGrades.studentId),
  );

  $$StudentGradesTableProcessedTableManager get studentGradesRefs {
    final manager = $$StudentGradesTableTableManager(
      $_db,
      $_db.studentGrades,
    ).filter((f) => f.studentId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_studentGradesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$StudentsTableFilterComposer
    extends Composer<_$AppDatabase, $StudentsTable> {
  $$StudentsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LevelsTableFilterComposer get currentLevelId {
    final $$LevelsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currentLevelId,
      referencedTable: $db.levels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LevelsTableFilterComposer(
            $db: $db,
            $table: $db.levels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> studentGradesRefs(
    Expression<bool> Function($$StudentGradesTableFilterComposer f) f,
  ) {
    final $$StudentGradesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studentGrades,
      getReferencedColumn: (t) => t.studentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentGradesTableFilterComposer(
            $db: $db,
            $table: $db.studentGrades,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StudentsTableOrderingComposer
    extends Composer<_$AppDatabase, $StudentsTable> {
  $$StudentsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LevelsTableOrderingComposer get currentLevelId {
    final $$LevelsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currentLevelId,
      referencedTable: $db.levels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LevelsTableOrderingComposer(
            $db: $db,
            $table: $db.levels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StudentsTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudentsTable> {
  $$StudentsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$LevelsTableAnnotationComposer get currentLevelId {
    final $$LevelsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currentLevelId,
      referencedTable: $db.levels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LevelsTableAnnotationComposer(
            $db: $db,
            $table: $db.levels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> studentGradesRefs<T extends Object>(
    Expression<T> Function($$StudentGradesTableAnnotationComposer a) f,
  ) {
    final $$StudentGradesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studentGrades,
      getReferencedColumn: (t) => t.studentId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentGradesTableAnnotationComposer(
            $db: $db,
            $table: $db.studentGrades,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$StudentsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudentsTable,
          Student,
          $$StudentsTableFilterComposer,
          $$StudentsTableOrderingComposer,
          $$StudentsTableAnnotationComposer,
          $$StudentsTableCreateCompanionBuilder,
          $$StudentsTableUpdateCompanionBuilder,
          (Student, $$StudentsTableReferences),
          Student,
          PrefetchHooks Function({
            bool userId,
            bool currentLevelId,
            bool studentGradesRefs,
          })
        > {
  $$StudentsTableTableManager(_$AppDatabase db, $StudentsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudentsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudentsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudentsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
                Value<int> currentLevelId = const Value.absent(),
              }) => StudentsCompanion(
                id: id,
                userId: userId,
                currentLevelId: currentLevelId,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int userId,
                required int currentLevelId,
              }) => StudentsCompanion.insert(
                id: id,
                userId: userId,
                currentLevelId: currentLevelId,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StudentsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                userId = false,
                currentLevelId = false,
                studentGradesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (studentGradesRefs) db.studentGrades,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (userId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.userId,
                                    referencedTable: $$StudentsTableReferences
                                        ._userIdTable(db),
                                    referencedColumn: $$StudentsTableReferences
                                        ._userIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }
                        if (currentLevelId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.currentLevelId,
                                    referencedTable: $$StudentsTableReferences
                                        ._currentLevelIdTable(db),
                                    referencedColumn: $$StudentsTableReferences
                                        ._currentLevelIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (studentGradesRefs)
                        await $_getPrefetchedData<
                          Student,
                          $StudentsTable,
                          StudentGrade
                        >(
                          currentTable: table,
                          referencedTable: $$StudentsTableReferences
                              ._studentGradesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$StudentsTableReferences(
                                db,
                                table,
                                p0,
                              ).studentGradesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.studentId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$StudentsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudentsTable,
      Student,
      $$StudentsTableFilterComposer,
      $$StudentsTableOrderingComposer,
      $$StudentsTableAnnotationComposer,
      $$StudentsTableCreateCompanionBuilder,
      $$StudentsTableUpdateCompanionBuilder,
      (Student, $$StudentsTableReferences),
      Student,
      PrefetchHooks Function({
        bool userId,
        bool currentLevelId,
        bool studentGradesRefs,
      })
    >;
typedef $$AdminsTableCreateCompanionBuilder =
    AdminsCompanion Function({Value<int> id, required int userId});
typedef $$AdminsTableUpdateCompanionBuilder =
    AdminsCompanion Function({Value<int> id, Value<int> userId});

final class $$AdminsTableReferences
    extends BaseReferences<_$AppDatabase, $AdminsTable, Admin> {
  $$AdminsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UsersTable _userIdTable(_$AppDatabase db) =>
      db.users.createAlias($_aliasNameGenerator(db.admins.userId, db.users.id));

  $$UsersTableProcessedTableManager get userId {
    final $_column = $_itemColumn<int>('user_id')!;

    final manager = $$UsersTableTableManager(
      $_db,
      $_db.users,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_userIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$AdminsTableFilterComposer
    extends Composer<_$AppDatabase, $AdminsTable> {
  $$AdminsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  $$UsersTableFilterComposer get userId {
    final $$UsersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableFilterComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AdminsTableOrderingComposer
    extends Composer<_$AppDatabase, $AdminsTable> {
  $$AdminsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  $$UsersTableOrderingComposer get userId {
    final $$UsersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableOrderingComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AdminsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AdminsTable> {
  $$AdminsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  $$UsersTableAnnotationComposer get userId {
    final $$UsersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.userId,
      referencedTable: $db.users,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UsersTableAnnotationComposer(
            $db: $db,
            $table: $db.users,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$AdminsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AdminsTable,
          Admin,
          $$AdminsTableFilterComposer,
          $$AdminsTableOrderingComposer,
          $$AdminsTableAnnotationComposer,
          $$AdminsTableCreateCompanionBuilder,
          $$AdminsTableUpdateCompanionBuilder,
          (Admin, $$AdminsTableReferences),
          Admin,
          PrefetchHooks Function({bool userId})
        > {
  $$AdminsTableTableManager(_$AppDatabase db, $AdminsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AdminsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AdminsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AdminsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> userId = const Value.absent(),
              }) => AdminsCompanion(id: id, userId: userId),
          createCompanionCallback:
              ({Value<int> id = const Value.absent(), required int userId}) =>
                  AdminsCompanion.insert(id: id, userId: userId),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$AdminsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({userId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (userId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.userId,
                                referencedTable: $$AdminsTableReferences
                                    ._userIdTable(db),
                                referencedColumn: $$AdminsTableReferences
                                    ._userIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$AdminsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AdminsTable,
      Admin,
      $$AdminsTableFilterComposer,
      $$AdminsTableOrderingComposer,
      $$AdminsTableAnnotationComposer,
      $$AdminsTableCreateCompanionBuilder,
      $$AdminsTableUpdateCompanionBuilder,
      (Admin, $$AdminsTableReferences),
      Admin,
      PrefetchHooks Function({bool userId})
    >;
typedef $$UnitsTableCreateCompanionBuilder =
    UnitsCompanion Function({
      Value<int> id,
      required int levelId,
      required String title,
      required int number,
    });
typedef $$UnitsTableUpdateCompanionBuilder =
    UnitsCompanion Function({
      Value<int> id,
      Value<int> levelId,
      Value<String> title,
      Value<int> number,
    });

final class $$UnitsTableReferences
    extends BaseReferences<_$AppDatabase, $UnitsTable, Unit> {
  $$UnitsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LevelsTable _levelIdTable(_$AppDatabase db) => db.levels.createAlias(
    $_aliasNameGenerator(db.units.levelId, db.levels.id),
  );

  $$LevelsTableProcessedTableManager get levelId {
    final $_column = $_itemColumn<int>('level_id')!;

    final manager = $$LevelsTableTableManager(
      $_db,
      $_db.levels,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_levelIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$LessonsTable, List<Lesson>> _lessonsRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.lessons,
    aliasName: $_aliasNameGenerator(db.units.id, db.lessons.unitId),
  );

  $$LessonsTableProcessedTableManager get lessonsRefs {
    final manager = $$LessonsTableTableManager(
      $_db,
      $_db.lessons,
    ).filter((f) => f.unitId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_lessonsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$UnitsTableFilterComposer extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  $$LevelsTableFilterComposer get levelId {
    final $$LevelsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.levelId,
      referencedTable: $db.levels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LevelsTableFilterComposer(
            $db: $db,
            $table: $db.levels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> lessonsRefs(
    Expression<bool> Function($$LessonsTableFilterComposer f) f,
  ) {
    final $$LessonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lessons,
      getReferencedColumn: (t) => t.unitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonsTableFilterComposer(
            $db: $db,
            $table: $db.lessons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UnitsTableOrderingComposer
    extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  $$LevelsTableOrderingComposer get levelId {
    final $$LevelsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.levelId,
      referencedTable: $db.levels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LevelsTableOrderingComposer(
            $db: $db,
            $table: $db.levels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$UnitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $UnitsTable> {
  $$UnitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  $$LevelsTableAnnotationComposer get levelId {
    final $$LevelsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.levelId,
      referencedTable: $db.levels,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LevelsTableAnnotationComposer(
            $db: $db,
            $table: $db.levels,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> lessonsRefs<T extends Object>(
    Expression<T> Function($$LessonsTableAnnotationComposer a) f,
  ) {
    final $$LessonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.lessons,
      getReferencedColumn: (t) => t.unitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonsTableAnnotationComposer(
            $db: $db,
            $table: $db.lessons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$UnitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $UnitsTable,
          Unit,
          $$UnitsTableFilterComposer,
          $$UnitsTableOrderingComposer,
          $$UnitsTableAnnotationComposer,
          $$UnitsTableCreateCompanionBuilder,
          $$UnitsTableUpdateCompanionBuilder,
          (Unit, $$UnitsTableReferences),
          Unit,
          PrefetchHooks Function({bool levelId, bool lessonsRefs})
        > {
  $$UnitsTableTableManager(_$AppDatabase db, $UnitsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$UnitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$UnitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$UnitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> levelId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> number = const Value.absent(),
              }) => UnitsCompanion(
                id: id,
                levelId: levelId,
                title: title,
                number: number,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int levelId,
                required String title,
                required int number,
              }) => UnitsCompanion.insert(
                id: id,
                levelId: levelId,
                title: title,
                number: number,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$UnitsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({levelId = false, lessonsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (lessonsRefs) db.lessons],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (levelId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.levelId,
                                referencedTable: $$UnitsTableReferences
                                    ._levelIdTable(db),
                                referencedColumn: $$UnitsTableReferences
                                    ._levelIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (lessonsRefs)
                    await $_getPrefetchedData<Unit, $UnitsTable, Lesson>(
                      currentTable: table,
                      referencedTable: $$UnitsTableReferences._lessonsRefsTable(
                        db,
                      ),
                      managerFromTypedResult: (p0) =>
                          $$UnitsTableReferences(db, table, p0).lessonsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.unitId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$UnitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $UnitsTable,
      Unit,
      $$UnitsTableFilterComposer,
      $$UnitsTableOrderingComposer,
      $$UnitsTableAnnotationComposer,
      $$UnitsTableCreateCompanionBuilder,
      $$UnitsTableUpdateCompanionBuilder,
      (Unit, $$UnitsTableReferences),
      Unit,
      PrefetchHooks Function({bool levelId, bool lessonsRefs})
    >;
typedef $$LessonsTableCreateCompanionBuilder =
    LessonsCompanion Function({
      Value<int> id,
      required int unitId,
      required String title,
      required int number,
      Value<String> videoUrl,
    });
typedef $$LessonsTableUpdateCompanionBuilder =
    LessonsCompanion Function({
      Value<int> id,
      Value<int> unitId,
      Value<String> title,
      Value<int> number,
      Value<String> videoUrl,
    });

final class $$LessonsTableReferences
    extends BaseReferences<_$AppDatabase, $LessonsTable, Lesson> {
  $$LessonsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $UnitsTable _unitIdTable(_$AppDatabase db) => db.units.createAlias(
    $_aliasNameGenerator(db.lessons.unitId, db.units.id),
  );

  $$UnitsTableProcessedTableManager get unitId {
    final $_column = $_itemColumn<int>('unit_id')!;

    final manager = $$UnitsTableTableManager(
      $_db,
      $_db.units,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_unitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$VocabulariesTable, List<Vocabulary>>
  _vocabulariesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.vocabularies,
    aliasName: $_aliasNameGenerator(db.lessons.id, db.vocabularies.lessonId),
  );

  $$VocabulariesTableProcessedTableManager get vocabulariesRefs {
    final manager = $$VocabulariesTableTableManager(
      $_db,
      $_db.vocabularies,
    ).filter((f) => f.lessonId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_vocabulariesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$QuizzesTable, List<Quizze>> _quizzesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.quizzes,
    aliasName: $_aliasNameGenerator(db.lessons.id, db.quizzes.lessonId),
  );

  $$QuizzesTableProcessedTableManager get quizzesRefs {
    final manager = $$QuizzesTableTableManager(
      $_db,
      $_db.quizzes,
    ).filter((f) => f.lessonId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_quizzesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$LessonsTableFilterComposer
    extends Composer<_$AppDatabase, $LessonsTable> {
  $$LessonsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get videoUrl => $composableBuilder(
    column: $table.videoUrl,
    builder: (column) => ColumnFilters(column),
  );

  $$UnitsTableFilterComposer get unitId {
    final $$UnitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableFilterComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> vocabulariesRefs(
    Expression<bool> Function($$VocabulariesTableFilterComposer f) f,
  ) {
    final $$VocabulariesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vocabularies,
      getReferencedColumn: (t) => t.lessonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VocabulariesTableFilterComposer(
            $db: $db,
            $table: $db.vocabularies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> quizzesRefs(
    Expression<bool> Function($$QuizzesTableFilterComposer f) f,
  ) {
    final $$QuizzesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.quizzes,
      getReferencedColumn: (t) => t.lessonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuizzesTableFilterComposer(
            $db: $db,
            $table: $db.quizzes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LessonsTableOrderingComposer
    extends Composer<_$AppDatabase, $LessonsTable> {
  $$LessonsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get number => $composableBuilder(
    column: $table.number,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get videoUrl => $composableBuilder(
    column: $table.videoUrl,
    builder: (column) => ColumnOrderings(column),
  );

  $$UnitsTableOrderingComposer get unitId {
    final $$UnitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableOrderingComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$LessonsTableAnnotationComposer
    extends Composer<_$AppDatabase, $LessonsTable> {
  $$LessonsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<int> get number =>
      $composableBuilder(column: $table.number, builder: (column) => column);

  GeneratedColumn<String> get videoUrl =>
      $composableBuilder(column: $table.videoUrl, builder: (column) => column);

  $$UnitsTableAnnotationComposer get unitId {
    final $$UnitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.unitId,
      referencedTable: $db.units,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$UnitsTableAnnotationComposer(
            $db: $db,
            $table: $db.units,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> vocabulariesRefs<T extends Object>(
    Expression<T> Function($$VocabulariesTableAnnotationComposer a) f,
  ) {
    final $$VocabulariesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.vocabularies,
      getReferencedColumn: (t) => t.lessonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VocabulariesTableAnnotationComposer(
            $db: $db,
            $table: $db.vocabularies,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> quizzesRefs<T extends Object>(
    Expression<T> Function($$QuizzesTableAnnotationComposer a) f,
  ) {
    final $$QuizzesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.quizzes,
      getReferencedColumn: (t) => t.lessonId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuizzesTableAnnotationComposer(
            $db: $db,
            $table: $db.quizzes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$LessonsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $LessonsTable,
          Lesson,
          $$LessonsTableFilterComposer,
          $$LessonsTableOrderingComposer,
          $$LessonsTableAnnotationComposer,
          $$LessonsTableCreateCompanionBuilder,
          $$LessonsTableUpdateCompanionBuilder,
          (Lesson, $$LessonsTableReferences),
          Lesson,
          PrefetchHooks Function({
            bool unitId,
            bool vocabulariesRefs,
            bool quizzesRefs,
          })
        > {
  $$LessonsTableTableManager(_$AppDatabase db, $LessonsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$LessonsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$LessonsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$LessonsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> unitId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<int> number = const Value.absent(),
                Value<String> videoUrl = const Value.absent(),
              }) => LessonsCompanion(
                id: id,
                unitId: unitId,
                title: title,
                number: number,
                videoUrl: videoUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int unitId,
                required String title,
                required int number,
                Value<String> videoUrl = const Value.absent(),
              }) => LessonsCompanion.insert(
                id: id,
                unitId: unitId,
                title: title,
                number: number,
                videoUrl: videoUrl,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$LessonsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                unitId = false,
                vocabulariesRefs = false,
                quizzesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (vocabulariesRefs) db.vocabularies,
                    if (quizzesRefs) db.quizzes,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (unitId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.unitId,
                                    referencedTable: $$LessonsTableReferences
                                        ._unitIdTable(db),
                                    referencedColumn: $$LessonsTableReferences
                                        ._unitIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (vocabulariesRefs)
                        await $_getPrefetchedData<
                          Lesson,
                          $LessonsTable,
                          Vocabulary
                        >(
                          currentTable: table,
                          referencedTable: $$LessonsTableReferences
                              ._vocabulariesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LessonsTableReferences(
                                db,
                                table,
                                p0,
                              ).vocabulariesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.lessonId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (quizzesRefs)
                        await $_getPrefetchedData<
                          Lesson,
                          $LessonsTable,
                          Quizze
                        >(
                          currentTable: table,
                          referencedTable: $$LessonsTableReferences
                              ._quizzesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$LessonsTableReferences(
                                db,
                                table,
                                p0,
                              ).quizzesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.lessonId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$LessonsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $LessonsTable,
      Lesson,
      $$LessonsTableFilterComposer,
      $$LessonsTableOrderingComposer,
      $$LessonsTableAnnotationComposer,
      $$LessonsTableCreateCompanionBuilder,
      $$LessonsTableUpdateCompanionBuilder,
      (Lesson, $$LessonsTableReferences),
      Lesson,
      PrefetchHooks Function({
        bool unitId,
        bool vocabulariesRefs,
        bool quizzesRefs,
      })
    >;
typedef $$VocabulariesTableCreateCompanionBuilder =
    VocabulariesCompanion Function({
      Value<int> id,
      required int lessonId,
      required String word,
      required String translation,
      Value<String> voiceUrl,
    });
typedef $$VocabulariesTableUpdateCompanionBuilder =
    VocabulariesCompanion Function({
      Value<int> id,
      Value<int> lessonId,
      Value<String> word,
      Value<String> translation,
      Value<String> voiceUrl,
    });

final class $$VocabulariesTableReferences
    extends BaseReferences<_$AppDatabase, $VocabulariesTable, Vocabulary> {
  $$VocabulariesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LessonsTable _lessonIdTable(_$AppDatabase db) =>
      db.lessons.createAlias(
        $_aliasNameGenerator(db.vocabularies.lessonId, db.lessons.id),
      );

  $$LessonsTableProcessedTableManager get lessonId {
    final $_column = $_itemColumn<int>('lesson_id')!;

    final manager = $$LessonsTableTableManager(
      $_db,
      $_db.lessons,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_lessonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$VocabulariesTableFilterComposer
    extends Composer<_$AppDatabase, $VocabulariesTable> {
  $$VocabulariesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get translation => $composableBuilder(
    column: $table.translation,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get voiceUrl => $composableBuilder(
    column: $table.voiceUrl,
    builder: (column) => ColumnFilters(column),
  );

  $$LessonsTableFilterComposer get lessonId {
    final $$LessonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lessonId,
      referencedTable: $db.lessons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonsTableFilterComposer(
            $db: $db,
            $table: $db.lessons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VocabulariesTableOrderingComposer
    extends Composer<_$AppDatabase, $VocabulariesTable> {
  $$VocabulariesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get word => $composableBuilder(
    column: $table.word,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get translation => $composableBuilder(
    column: $table.translation,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get voiceUrl => $composableBuilder(
    column: $table.voiceUrl,
    builder: (column) => ColumnOrderings(column),
  );

  $$LessonsTableOrderingComposer get lessonId {
    final $$LessonsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lessonId,
      referencedTable: $db.lessons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonsTableOrderingComposer(
            $db: $db,
            $table: $db.lessons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VocabulariesTableAnnotationComposer
    extends Composer<_$AppDatabase, $VocabulariesTable> {
  $$VocabulariesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get word =>
      $composableBuilder(column: $table.word, builder: (column) => column);

  GeneratedColumn<String> get translation => $composableBuilder(
    column: $table.translation,
    builder: (column) => column,
  );

  GeneratedColumn<String> get voiceUrl =>
      $composableBuilder(column: $table.voiceUrl, builder: (column) => column);

  $$LessonsTableAnnotationComposer get lessonId {
    final $$LessonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lessonId,
      referencedTable: $db.lessons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonsTableAnnotationComposer(
            $db: $db,
            $table: $db.lessons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$VocabulariesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VocabulariesTable,
          Vocabulary,
          $$VocabulariesTableFilterComposer,
          $$VocabulariesTableOrderingComposer,
          $$VocabulariesTableAnnotationComposer,
          $$VocabulariesTableCreateCompanionBuilder,
          $$VocabulariesTableUpdateCompanionBuilder,
          (Vocabulary, $$VocabulariesTableReferences),
          Vocabulary,
          PrefetchHooks Function({bool lessonId})
        > {
  $$VocabulariesTableTableManager(_$AppDatabase db, $VocabulariesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VocabulariesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VocabulariesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VocabulariesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> lessonId = const Value.absent(),
                Value<String> word = const Value.absent(),
                Value<String> translation = const Value.absent(),
                Value<String> voiceUrl = const Value.absent(),
              }) => VocabulariesCompanion(
                id: id,
                lessonId: lessonId,
                word: word,
                translation: translation,
                voiceUrl: voiceUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int lessonId,
                required String word,
                required String translation,
                Value<String> voiceUrl = const Value.absent(),
              }) => VocabulariesCompanion.insert(
                id: id,
                lessonId: lessonId,
                word: word,
                translation: translation,
                voiceUrl: voiceUrl,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VocabulariesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({lessonId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (lessonId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.lessonId,
                                referencedTable: $$VocabulariesTableReferences
                                    ._lessonIdTable(db),
                                referencedColumn: $$VocabulariesTableReferences
                                    ._lessonIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$VocabulariesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VocabulariesTable,
      Vocabulary,
      $$VocabulariesTableFilterComposer,
      $$VocabulariesTableOrderingComposer,
      $$VocabulariesTableAnnotationComposer,
      $$VocabulariesTableCreateCompanionBuilder,
      $$VocabulariesTableUpdateCompanionBuilder,
      (Vocabulary, $$VocabulariesTableReferences),
      Vocabulary,
      PrefetchHooks Function({bool lessonId})
    >;
typedef $$QuizzesTableCreateCompanionBuilder =
    QuizzesCompanion Function({
      Value<int> id,
      required int lessonId,
      required String title,
      Value<String> type,
      Value<int> durationMinutes,
    });
typedef $$QuizzesTableUpdateCompanionBuilder =
    QuizzesCompanion Function({
      Value<int> id,
      Value<int> lessonId,
      Value<String> title,
      Value<String> type,
      Value<int> durationMinutes,
    });

final class $$QuizzesTableReferences
    extends BaseReferences<_$AppDatabase, $QuizzesTable, Quizze> {
  $$QuizzesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $LessonsTable _lessonIdTable(_$AppDatabase db) => db.lessons
      .createAlias($_aliasNameGenerator(db.quizzes.lessonId, db.lessons.id));

  $$LessonsTableProcessedTableManager get lessonId {
    final $_column = $_itemColumn<int>('lesson_id')!;

    final manager = $$LessonsTableTableManager(
      $_db,
      $_db.lessons,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_lessonIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$QuestionsTable, List<Question>>
  _questionsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.questions,
    aliasName: $_aliasNameGenerator(db.quizzes.id, db.questions.quizId),
  );

  $$QuestionsTableProcessedTableManager get questionsRefs {
    final manager = $$QuestionsTableTableManager(
      $_db,
      $_db.questions,
    ).filter((f) => f.quizId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_questionsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$StudentGradesTable, List<StudentGrade>>
  _studentGradesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.studentGrades,
    aliasName: $_aliasNameGenerator(db.quizzes.id, db.studentGrades.quizId),
  );

  $$StudentGradesTableProcessedTableManager get studentGradesRefs {
    final manager = $$StudentGradesTableTableManager(
      $_db,
      $_db.studentGrades,
    ).filter((f) => f.quizId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_studentGradesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$QuizzesTableFilterComposer
    extends Composer<_$AppDatabase, $QuizzesTable> {
  $$QuizzesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnFilters(column),
  );

  $$LessonsTableFilterComposer get lessonId {
    final $$LessonsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lessonId,
      referencedTable: $db.lessons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonsTableFilterComposer(
            $db: $db,
            $table: $db.lessons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> questionsRefs(
    Expression<bool> Function($$QuestionsTableFilterComposer f) f,
  ) {
    final $$QuestionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.questions,
      getReferencedColumn: (t) => t.quizId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionsTableFilterComposer(
            $db: $db,
            $table: $db.questions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> studentGradesRefs(
    Expression<bool> Function($$StudentGradesTableFilterComposer f) f,
  ) {
    final $$StudentGradesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studentGrades,
      getReferencedColumn: (t) => t.quizId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentGradesTableFilterComposer(
            $db: $db,
            $table: $db.studentGrades,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$QuizzesTableOrderingComposer
    extends Composer<_$AppDatabase, $QuizzesTable> {
  $$QuizzesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => ColumnOrderings(column),
  );

  $$LessonsTableOrderingComposer get lessonId {
    final $$LessonsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lessonId,
      referencedTable: $db.lessons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonsTableOrderingComposer(
            $db: $db,
            $table: $db.lessons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$QuizzesTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuizzesTable> {
  $$QuizzesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<int> get durationMinutes => $composableBuilder(
    column: $table.durationMinutes,
    builder: (column) => column,
  );

  $$LessonsTableAnnotationComposer get lessonId {
    final $$LessonsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.lessonId,
      referencedTable: $db.lessons,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$LessonsTableAnnotationComposer(
            $db: $db,
            $table: $db.lessons,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> questionsRefs<T extends Object>(
    Expression<T> Function($$QuestionsTableAnnotationComposer a) f,
  ) {
    final $$QuestionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.questions,
      getReferencedColumn: (t) => t.quizId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionsTableAnnotationComposer(
            $db: $db,
            $table: $db.questions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> studentGradesRefs<T extends Object>(
    Expression<T> Function($$StudentGradesTableAnnotationComposer a) f,
  ) {
    final $$StudentGradesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.studentGrades,
      getReferencedColumn: (t) => t.quizId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentGradesTableAnnotationComposer(
            $db: $db,
            $table: $db.studentGrades,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$QuizzesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuizzesTable,
          Quizze,
          $$QuizzesTableFilterComposer,
          $$QuizzesTableOrderingComposer,
          $$QuizzesTableAnnotationComposer,
          $$QuizzesTableCreateCompanionBuilder,
          $$QuizzesTableUpdateCompanionBuilder,
          (Quizze, $$QuizzesTableReferences),
          Quizze,
          PrefetchHooks Function({
            bool lessonId,
            bool questionsRefs,
            bool studentGradesRefs,
          })
        > {
  $$QuizzesTableTableManager(_$AppDatabase db, $QuizzesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuizzesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuizzesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuizzesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> lessonId = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<int> durationMinutes = const Value.absent(),
              }) => QuizzesCompanion(
                id: id,
                lessonId: lessonId,
                title: title,
                type: type,
                durationMinutes: durationMinutes,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int lessonId,
                required String title,
                Value<String> type = const Value.absent(),
                Value<int> durationMinutes = const Value.absent(),
              }) => QuizzesCompanion.insert(
                id: id,
                lessonId: lessonId,
                title: title,
                type: type,
                durationMinutes: durationMinutes,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$QuizzesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({
                lessonId = false,
                questionsRefs = false,
                studentGradesRefs = false,
              }) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (questionsRefs) db.questions,
                    if (studentGradesRefs) db.studentGrades,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (lessonId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.lessonId,
                                    referencedTable: $$QuizzesTableReferences
                                        ._lessonIdTable(db),
                                    referencedColumn: $$QuizzesTableReferences
                                        ._lessonIdTable(db)
                                        .id,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (questionsRefs)
                        await $_getPrefetchedData<
                          Quizze,
                          $QuizzesTable,
                          Question
                        >(
                          currentTable: table,
                          referencedTable: $$QuizzesTableReferences
                              ._questionsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$QuizzesTableReferences(
                                db,
                                table,
                                p0,
                              ).questionsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.quizId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (studentGradesRefs)
                        await $_getPrefetchedData<
                          Quizze,
                          $QuizzesTable,
                          StudentGrade
                        >(
                          currentTable: table,
                          referencedTable: $$QuizzesTableReferences
                              ._studentGradesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$QuizzesTableReferences(
                                db,
                                table,
                                p0,
                              ).studentGradesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.quizId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$QuizzesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuizzesTable,
      Quizze,
      $$QuizzesTableFilterComposer,
      $$QuizzesTableOrderingComposer,
      $$QuizzesTableAnnotationComposer,
      $$QuizzesTableCreateCompanionBuilder,
      $$QuizzesTableUpdateCompanionBuilder,
      (Quizze, $$QuizzesTableReferences),
      Quizze,
      PrefetchHooks Function({
        bool lessonId,
        bool questionsRefs,
        bool studentGradesRefs,
      })
    >;
typedef $$QuestionsTableCreateCompanionBuilder =
    QuestionsCompanion Function({
      Value<int> id,
      required int quizId,
      required String questionText,
      Value<String> imageUrl,
    });
typedef $$QuestionsTableUpdateCompanionBuilder =
    QuestionsCompanion Function({
      Value<int> id,
      Value<int> quizId,
      Value<String> questionText,
      Value<String> imageUrl,
    });

final class $$QuestionsTableReferences
    extends BaseReferences<_$AppDatabase, $QuestionsTable, Question> {
  $$QuestionsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $QuizzesTable _quizIdTable(_$AppDatabase db) => db.quizzes.createAlias(
    $_aliasNameGenerator(db.questions.quizId, db.quizzes.id),
  );

  $$QuizzesTableProcessedTableManager get quizId {
    final $_column = $_itemColumn<int>('quiz_id')!;

    final manager = $$QuizzesTableTableManager(
      $_db,
      $_db.quizzes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_quizIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$ChoicesTable, List<Choice>> _choicesRefsTable(
    _$AppDatabase db,
  ) => MultiTypedResultKey.fromTable(
    db.choices,
    aliasName: $_aliasNameGenerator(db.questions.id, db.choices.questionId),
  );

  $$ChoicesTableProcessedTableManager get choicesRefs {
    final manager = $$ChoicesTableTableManager(
      $_db,
      $_db.choices,
    ).filter((f) => f.questionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_choicesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$QuestionsTableFilterComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get questionText => $composableBuilder(
    column: $table.questionText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnFilters(column),
  );

  $$QuizzesTableFilterComposer get quizId {
    final $$QuizzesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.quizId,
      referencedTable: $db.quizzes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuizzesTableFilterComposer(
            $db: $db,
            $table: $db.quizzes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> choicesRefs(
    Expression<bool> Function($$ChoicesTableFilterComposer f) f,
  ) {
    final $$ChoicesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.choices,
      getReferencedColumn: (t) => t.questionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChoicesTableFilterComposer(
            $db: $db,
            $table: $db.choices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$QuestionsTableOrderingComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get questionText => $composableBuilder(
    column: $table.questionText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get imageUrl => $composableBuilder(
    column: $table.imageUrl,
    builder: (column) => ColumnOrderings(column),
  );

  $$QuizzesTableOrderingComposer get quizId {
    final $$QuizzesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.quizId,
      referencedTable: $db.quizzes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuizzesTableOrderingComposer(
            $db: $db,
            $table: $db.quizzes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$QuestionsTableAnnotationComposer
    extends Composer<_$AppDatabase, $QuestionsTable> {
  $$QuestionsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get questionText => $composableBuilder(
    column: $table.questionText,
    builder: (column) => column,
  );

  GeneratedColumn<String> get imageUrl =>
      $composableBuilder(column: $table.imageUrl, builder: (column) => column);

  $$QuizzesTableAnnotationComposer get quizId {
    final $$QuizzesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.quizId,
      referencedTable: $db.quizzes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuizzesTableAnnotationComposer(
            $db: $db,
            $table: $db.quizzes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> choicesRefs<T extends Object>(
    Expression<T> Function($$ChoicesTableAnnotationComposer a) f,
  ) {
    final $$ChoicesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.choices,
      getReferencedColumn: (t) => t.questionId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ChoicesTableAnnotationComposer(
            $db: $db,
            $table: $db.choices,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$QuestionsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $QuestionsTable,
          Question,
          $$QuestionsTableFilterComposer,
          $$QuestionsTableOrderingComposer,
          $$QuestionsTableAnnotationComposer,
          $$QuestionsTableCreateCompanionBuilder,
          $$QuestionsTableUpdateCompanionBuilder,
          (Question, $$QuestionsTableReferences),
          Question,
          PrefetchHooks Function({bool quizId, bool choicesRefs})
        > {
  $$QuestionsTableTableManager(_$AppDatabase db, $QuestionsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$QuestionsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$QuestionsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$QuestionsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> quizId = const Value.absent(),
                Value<String> questionText = const Value.absent(),
                Value<String> imageUrl = const Value.absent(),
              }) => QuestionsCompanion(
                id: id,
                quizId: quizId,
                questionText: questionText,
                imageUrl: imageUrl,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int quizId,
                required String questionText,
                Value<String> imageUrl = const Value.absent(),
              }) => QuestionsCompanion.insert(
                id: id,
                quizId: quizId,
                questionText: questionText,
                imageUrl: imageUrl,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$QuestionsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({quizId = false, choicesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [if (choicesRefs) db.choices],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (quizId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.quizId,
                                referencedTable: $$QuestionsTableReferences
                                    ._quizIdTable(db),
                                referencedColumn: $$QuestionsTableReferences
                                    ._quizIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (choicesRefs)
                    await $_getPrefetchedData<
                      Question,
                      $QuestionsTable,
                      Choice
                    >(
                      currentTable: table,
                      referencedTable: $$QuestionsTableReferences
                          ._choicesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$QuestionsTableReferences(db, table, p0).choicesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.questionId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$QuestionsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $QuestionsTable,
      Question,
      $$QuestionsTableFilterComposer,
      $$QuestionsTableOrderingComposer,
      $$QuestionsTableAnnotationComposer,
      $$QuestionsTableCreateCompanionBuilder,
      $$QuestionsTableUpdateCompanionBuilder,
      (Question, $$QuestionsTableReferences),
      Question,
      PrefetchHooks Function({bool quizId, bool choicesRefs})
    >;
typedef $$ChoicesTableCreateCompanionBuilder =
    ChoicesCompanion Function({
      Value<int> id,
      required int questionId,
      required String choiceText,
      Value<bool> isCorrect,
    });
typedef $$ChoicesTableUpdateCompanionBuilder =
    ChoicesCompanion Function({
      Value<int> id,
      Value<int> questionId,
      Value<String> choiceText,
      Value<bool> isCorrect,
    });

final class $$ChoicesTableReferences
    extends BaseReferences<_$AppDatabase, $ChoicesTable, Choice> {
  $$ChoicesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $QuestionsTable _questionIdTable(_$AppDatabase db) =>
      db.questions.createAlias(
        $_aliasNameGenerator(db.choices.questionId, db.questions.id),
      );

  $$QuestionsTableProcessedTableManager get questionId {
    final $_column = $_itemColumn<int>('question_id')!;

    final manager = $$QuestionsTableTableManager(
      $_db,
      $_db.questions,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_questionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ChoicesTableFilterComposer
    extends Composer<_$AppDatabase, $ChoicesTable> {
  $$ChoicesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get choiceText => $composableBuilder(
    column: $table.choiceText,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isCorrect => $composableBuilder(
    column: $table.isCorrect,
    builder: (column) => ColumnFilters(column),
  );

  $$QuestionsTableFilterComposer get questionId {
    final $$QuestionsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.questionId,
      referencedTable: $db.questions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionsTableFilterComposer(
            $db: $db,
            $table: $db.questions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChoicesTableOrderingComposer
    extends Composer<_$AppDatabase, $ChoicesTable> {
  $$ChoicesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get choiceText => $composableBuilder(
    column: $table.choiceText,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isCorrect => $composableBuilder(
    column: $table.isCorrect,
    builder: (column) => ColumnOrderings(column),
  );

  $$QuestionsTableOrderingComposer get questionId {
    final $$QuestionsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.questionId,
      referencedTable: $db.questions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionsTableOrderingComposer(
            $db: $db,
            $table: $db.questions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChoicesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ChoicesTable> {
  $$ChoicesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get choiceText => $composableBuilder(
    column: $table.choiceText,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isCorrect =>
      $composableBuilder(column: $table.isCorrect, builder: (column) => column);

  $$QuestionsTableAnnotationComposer get questionId {
    final $$QuestionsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.questionId,
      referencedTable: $db.questions,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuestionsTableAnnotationComposer(
            $db: $db,
            $table: $db.questions,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ChoicesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ChoicesTable,
          Choice,
          $$ChoicesTableFilterComposer,
          $$ChoicesTableOrderingComposer,
          $$ChoicesTableAnnotationComposer,
          $$ChoicesTableCreateCompanionBuilder,
          $$ChoicesTableUpdateCompanionBuilder,
          (Choice, $$ChoicesTableReferences),
          Choice,
          PrefetchHooks Function({bool questionId})
        > {
  $$ChoicesTableTableManager(_$AppDatabase db, $ChoicesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ChoicesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ChoicesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ChoicesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> questionId = const Value.absent(),
                Value<String> choiceText = const Value.absent(),
                Value<bool> isCorrect = const Value.absent(),
              }) => ChoicesCompanion(
                id: id,
                questionId: questionId,
                choiceText: choiceText,
                isCorrect: isCorrect,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int questionId,
                required String choiceText,
                Value<bool> isCorrect = const Value.absent(),
              }) => ChoicesCompanion.insert(
                id: id,
                questionId: questionId,
                choiceText: choiceText,
                isCorrect: isCorrect,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ChoicesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({questionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (questionId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.questionId,
                                referencedTable: $$ChoicesTableReferences
                                    ._questionIdTable(db),
                                referencedColumn: $$ChoicesTableReferences
                                    ._questionIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ChoicesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ChoicesTable,
      Choice,
      $$ChoicesTableFilterComposer,
      $$ChoicesTableOrderingComposer,
      $$ChoicesTableAnnotationComposer,
      $$ChoicesTableCreateCompanionBuilder,
      $$ChoicesTableUpdateCompanionBuilder,
      (Choice, $$ChoicesTableReferences),
      Choice,
      PrefetchHooks Function({bool questionId})
    >;
typedef $$StudentGradesTableCreateCompanionBuilder =
    StudentGradesCompanion Function({
      Value<int> id,
      required int studentId,
      required int quizId,
      required int score,
      Value<DateTime> takenAt,
    });
typedef $$StudentGradesTableUpdateCompanionBuilder =
    StudentGradesCompanion Function({
      Value<int> id,
      Value<int> studentId,
      Value<int> quizId,
      Value<int> score,
      Value<DateTime> takenAt,
    });

final class $$StudentGradesTableReferences
    extends BaseReferences<_$AppDatabase, $StudentGradesTable, StudentGrade> {
  $$StudentGradesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $StudentsTable _studentIdTable(_$AppDatabase db) =>
      db.students.createAlias(
        $_aliasNameGenerator(db.studentGrades.studentId, db.students.id),
      );

  $$StudentsTableProcessedTableManager get studentId {
    final $_column = $_itemColumn<int>('student_id')!;

    final manager = $$StudentsTableTableManager(
      $_db,
      $_db.students,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_studentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $QuizzesTable _quizIdTable(_$AppDatabase db) => db.quizzes.createAlias(
    $_aliasNameGenerator(db.studentGrades.quizId, db.quizzes.id),
  );

  $$QuizzesTableProcessedTableManager get quizId {
    final $_column = $_itemColumn<int>('quiz_id')!;

    final manager = $$QuizzesTableTableManager(
      $_db,
      $_db.quizzes,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_quizIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$StudentGradesTableFilterComposer
    extends Composer<_$AppDatabase, $StudentGradesTable> {
  $$StudentGradesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get takenAt => $composableBuilder(
    column: $table.takenAt,
    builder: (column) => ColumnFilters(column),
  );

  $$StudentsTableFilterComposer get studentId {
    final $$StudentsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableFilterComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$QuizzesTableFilterComposer get quizId {
    final $$QuizzesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.quizId,
      referencedTable: $db.quizzes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuizzesTableFilterComposer(
            $db: $db,
            $table: $db.quizzes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StudentGradesTableOrderingComposer
    extends Composer<_$AppDatabase, $StudentGradesTable> {
  $$StudentGradesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get score => $composableBuilder(
    column: $table.score,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get takenAt => $composableBuilder(
    column: $table.takenAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$StudentsTableOrderingComposer get studentId {
    final $$StudentsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableOrderingComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$QuizzesTableOrderingComposer get quizId {
    final $$QuizzesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.quizId,
      referencedTable: $db.quizzes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuizzesTableOrderingComposer(
            $db: $db,
            $table: $db.quizzes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StudentGradesTableAnnotationComposer
    extends Composer<_$AppDatabase, $StudentGradesTable> {
  $$StudentGradesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get score =>
      $composableBuilder(column: $table.score, builder: (column) => column);

  GeneratedColumn<DateTime> get takenAt =>
      $composableBuilder(column: $table.takenAt, builder: (column) => column);

  $$StudentsTableAnnotationComposer get studentId {
    final $$StudentsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.studentId,
      referencedTable: $db.students,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$StudentsTableAnnotationComposer(
            $db: $db,
            $table: $db.students,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$QuizzesTableAnnotationComposer get quizId {
    final $$QuizzesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.quizId,
      referencedTable: $db.quizzes,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$QuizzesTableAnnotationComposer(
            $db: $db,
            $table: $db.quizzes,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$StudentGradesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $StudentGradesTable,
          StudentGrade,
          $$StudentGradesTableFilterComposer,
          $$StudentGradesTableOrderingComposer,
          $$StudentGradesTableAnnotationComposer,
          $$StudentGradesTableCreateCompanionBuilder,
          $$StudentGradesTableUpdateCompanionBuilder,
          (StudentGrade, $$StudentGradesTableReferences),
          StudentGrade,
          PrefetchHooks Function({bool studentId, bool quizId})
        > {
  $$StudentGradesTableTableManager(_$AppDatabase db, $StudentGradesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$StudentGradesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$StudentGradesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$StudentGradesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> studentId = const Value.absent(),
                Value<int> quizId = const Value.absent(),
                Value<int> score = const Value.absent(),
                Value<DateTime> takenAt = const Value.absent(),
              }) => StudentGradesCompanion(
                id: id,
                studentId: studentId,
                quizId: quizId,
                score: score,
                takenAt: takenAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int studentId,
                required int quizId,
                required int score,
                Value<DateTime> takenAt = const Value.absent(),
              }) => StudentGradesCompanion.insert(
                id: id,
                studentId: studentId,
                quizId: quizId,
                score: score,
                takenAt: takenAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$StudentGradesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({studentId = false, quizId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (studentId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.studentId,
                                referencedTable: $$StudentGradesTableReferences
                                    ._studentIdTable(db),
                                referencedColumn: $$StudentGradesTableReferences
                                    ._studentIdTable(db)
                                    .id,
                              )
                              as T;
                    }
                    if (quizId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.quizId,
                                referencedTable: $$StudentGradesTableReferences
                                    ._quizIdTable(db),
                                referencedColumn: $$StudentGradesTableReferences
                                    ._quizIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$StudentGradesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $StudentGradesTable,
      StudentGrade,
      $$StudentGradesTableFilterComposer,
      $$StudentGradesTableOrderingComposer,
      $$StudentGradesTableAnnotationComposer,
      $$StudentGradesTableCreateCompanionBuilder,
      $$StudentGradesTableUpdateCompanionBuilder,
      (StudentGrade, $$StudentGradesTableReferences),
      StudentGrade,
      PrefetchHooks Function({bool studentId, bool quizId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$UsersTableTableManager get users =>
      $$UsersTableTableManager(_db, _db.users);
  $$LevelsTableTableManager get levels =>
      $$LevelsTableTableManager(_db, _db.levels);
  $$StudentsTableTableManager get students =>
      $$StudentsTableTableManager(_db, _db.students);
  $$AdminsTableTableManager get admins =>
      $$AdminsTableTableManager(_db, _db.admins);
  $$UnitsTableTableManager get units =>
      $$UnitsTableTableManager(_db, _db.units);
  $$LessonsTableTableManager get lessons =>
      $$LessonsTableTableManager(_db, _db.lessons);
  $$VocabulariesTableTableManager get vocabularies =>
      $$VocabulariesTableTableManager(_db, _db.vocabularies);
  $$QuizzesTableTableManager get quizzes =>
      $$QuizzesTableTableManager(_db, _db.quizzes);
  $$QuestionsTableTableManager get questions =>
      $$QuestionsTableTableManager(_db, _db.questions);
  $$ChoicesTableTableManager get choices =>
      $$ChoicesTableTableManager(_db, _db.choices);
  $$StudentGradesTableTableManager get studentGrades =>
      $$StudentGradesTableTableManager(_db, _db.studentGrades);
}
