class Agent {
  final String id;
  final String name;
  final String email;
  final String? phone;

  const Agent({
    required this.id,
    required this.name,
    required this.email,
    this.phone,
  });

  factory Agent.fromJson(Map<String, dynamic> json) {
    return Agent(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String?,
    );
  }
}
