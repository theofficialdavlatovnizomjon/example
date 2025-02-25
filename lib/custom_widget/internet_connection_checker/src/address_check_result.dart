part of internet_connection_checker;

class AddressCheckResult {
  AddressCheckResult(
    this.options, {
    required this.isSuccess,
  });

  final AddressCheckOptions options;

  final bool isSuccess;

  @override
  String toString() => 'AddressCheckResult($options, $isSuccess)';
}
