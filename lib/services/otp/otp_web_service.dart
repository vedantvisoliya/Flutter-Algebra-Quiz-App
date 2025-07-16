import "dart:async";
import "dart:convert";
import "package:web_socket_client/web_socket_client.dart";

class OtpWebService {
  static final _instance = OtpWebService._internal();
  WebSocket? _socket;

  factory OtpWebService() => _instance;

  OtpWebService._internal();

  void connect() {
    _socket = WebSocket(
      Uri.parse("wss://flutter-algebra-quiz-app-backend.onrender.com/ws/otp"),
    );
  }

  void sendOtp(String email) {
    _socket?.send(jsonEncode({"email": email}));
  }

  Future<String> getOtp() async {
    final completer = Completer<String>();

    _socket!.messages.listen((message) {
      final data = jsonDecode(message);
      final otp = data["otp"];
      completer.complete(otp); // Complete the future
    });

    return completer.future;
  }
}
