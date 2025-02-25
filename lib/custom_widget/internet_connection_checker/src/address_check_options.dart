part of internet_connection_checker;

class AddressCheckOptions {
  AddressCheckOptions({
    this.address,
    this.hostname,
    this.port = InternetConnectionChecker.DEFAULT_PORT,
    this.timeout = InternetConnectionChecker.DEFAULT_TIMEOUT,
  }) : assert(
          (address != null || hostname != null) &&
              ((address != null) != (hostname != null)),
        );

  final InternetAddress? address;

  final String? hostname;

  final int port;

  final Duration timeout;

  @override
  String toString() => 'AddressCheckOptions($address, $port, $timeout)';
}
