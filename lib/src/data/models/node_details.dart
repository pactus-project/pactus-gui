class NodeDetails {
  NodeDetails({
    required this.ip,
    required this.port,
    this.password,
    required this.nodeType,
  });

  final String ip;
  final String nodeType;
  final int port;
  final String? password;

  // Optionally add a copyWith method for easier updates
  NodeDetails copyWith({
    String? ip,
    String? nodeType,
    int? port,
    String? password,
  }) {
    return NodeDetails(
      ip: ip ?? this.ip,
      nodeType: nodeType ?? this.nodeType,
      port: port ?? this.port,
      password: password ?? this.password,
    );
  }
}
