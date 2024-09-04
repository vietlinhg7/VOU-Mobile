class AccountInfo {
  String uniqueId;
  String username;
  String password;
  String avatarPath;
  DateTime birthDate;
  String email;
  String phoneNumber;
  Gender gender;
  String? facebookAccount;

  AccountInfo({
    required this.uniqueId,
    required this.username,
    required this.password,
    required this.avatarPath,
    required this.birthDate,
    required this.email,
    required this.phoneNumber,
    required this.gender,
    this.facebookAccount,
  });

  AccountInfo copyWith({
    String? uniqueId,
    String? username,
    String? password,
    String? avatarPath,
    DateTime? birthDate,
    String? email,
    String? phoneNumber,
    Gender? gender,
    String? facebookAccount,
  }) {
    return AccountInfo(
      uniqueId: uniqueId ?? this.uniqueId,
      username: username ?? this.username,
      password: password ?? this.password,
      avatarPath: avatarPath ?? this.avatarPath,
      birthDate: birthDate ?? this.birthDate,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
      facebookAccount: facebookAccount ?? this.facebookAccount,
    );
  }
}

enum Gender { male, female, other }
