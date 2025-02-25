part of internet_connection_checker;

class InternetConnectionChecker {
  factory InternetConnectionChecker() => _instance;

  InternetConnectionChecker.createInstance({
    this.checkTimeout = DEFAULT_TIMEOUT,
    this.checkInterval = DEFAULT_INTERVAL,
    List<AddressCheckOptions>? addresses,
  }) {
    this.addresses = addresses ??
        DEFAULT_ADDRESSES
            .map(
              (AddressCheckOptions e) => AddressCheckOptions(
                address: e.address,
                hostname: e.hostname,
                port: e.port,
                timeout: checkTimeout,
              ),
            )
            .toList();

    _statusController.onListen = () {
      _maybeEmitStatusUpdate();
    };

    _statusController.onCancel = () {
      _timerHandle?.cancel();
      _lastStatus = null;
    };
  }

  static const int DEFAULT_PORT = 53;

  static const Duration DEFAULT_TIMEOUT = Duration(seconds: 10);

  static const Duration DEFAULT_INTERVAL = Duration(seconds: 10);
  static final List<AddressCheckOptions> DEFAULT_ADDRESSES =
      List<AddressCheckOptions>.unmodifiable(
    <AddressCheckOptions>[
      AddressCheckOptions(
        address: InternetAddress(
          '1.1.1.1', // CloudFlare
          type: InternetAddressType.IPv4,
        ),
      ),
      AddressCheckOptions(
        address: InternetAddress(
          '2606:4700:4700::1111', // CloudFlare
          type: InternetAddressType.IPv6,
        ),
      ),
      AddressCheckOptions(
        address: InternetAddress(
          '8.8.4.4', // Google
          type: InternetAddressType.IPv4,
        ),
      ),
      AddressCheckOptions(
        address: InternetAddress(
          '2001:4860:4860::8888', // Google
          type: InternetAddressType.IPv6,
        ),
      ),
      AddressCheckOptions(
        address: InternetAddress(
          '208.67.222.222', // OpenDNS
          type: InternetAddressType.IPv4,
        ), // OpenDNS
      ),
      AddressCheckOptions(
        address: InternetAddress(
          '2620:0:ccc::2', // OpenDNS
          type: InternetAddressType.IPv6,
        ), // OpenDNS
      ),
    ],
  );

  late List<AddressCheckOptions> _addresses;

  List<AddressCheckOptions> get addresses => _addresses;

  set addresses(List<AddressCheckOptions> value) {
    _addresses = List<AddressCheckOptions>.unmodifiable(value);
    _maybeEmitStatusUpdate();
  }

  static final InternetConnectionChecker _instance =
      InternetConnectionChecker.createInstance();

  Future<AddressCheckResult> isHostReachable(
    AddressCheckOptions options,
  ) async {
    Socket? sock;
    try {
      sock = await Socket.connect(
        options.address ?? options.hostname,
        options.port,
        timeout: options.timeout,
      )
        ..destroy();
      return AddressCheckResult(
        options,
        isSuccess: true,
      );
    } catch (e) {
      sock?.destroy();
      return AddressCheckResult(
        options,
        isSuccess: false,
      );
    }
  }

  Future<bool> get hasConnection async {
    final Completer<bool> result = Completer<bool>();
    int length = addresses.length;

    for (final AddressCheckOptions addressOptions in addresses) {
      isHostReachable(addressOptions).then(
        (AddressCheckResult request) {
          length -= 1;
          if (!result.isCompleted) {
            if (request.isSuccess) {
              result.complete(true);
            } else if (length == 0) {
              result.complete(false);
            }
          }
        },
      );
    }

    return result.future;
  }

  Future<InternetConnectionStatus> get connectionStatus async {
    return await hasConnection
        ? InternetConnectionStatus.connected
        : InternetConnectionStatus.disconnected;
  }

  final Duration checkInterval;

  final Duration checkTimeout;

  Future<void> _maybeEmitStatusUpdate([
    Timer? timer,
  ]) async {
    _timerHandle?.cancel();
    timer?.cancel();

    final InternetConnectionStatus currentStatus = await connectionStatus;

    if (_lastStatus != currentStatus && _statusController.hasListener) {
      _statusController.add(currentStatus);
    }

    if (!_statusController.hasListener) return;
    _timerHandle = Timer(checkInterval, _maybeEmitStatusUpdate);

    _lastStatus = currentStatus;
  }

  InternetConnectionStatus? _lastStatus;
  Timer? _timerHandle;

  final StreamController<InternetConnectionStatus> _statusController =
      StreamController<InternetConnectionStatus>.broadcast();

  Stream<InternetConnectionStatus> get onStatusChange =>
      _statusController.stream;

  bool get hasListeners => _statusController.hasListener;

  bool get isActivelyChecking => _statusController.hasListener;
}
