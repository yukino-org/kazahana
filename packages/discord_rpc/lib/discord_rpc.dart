import 'dart:convert';
import 'dart:io';
import 'package:utilx/utils/string.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class DiscordRPC {
  DiscordRPC({
    required this.clientId,
    required this.port,
    required this.ws,
  });

  final String clientId;
  final int port;
  final WebSocketChannel ws;

  Future<void> setActivity(final DiscordPresence presence) {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{
      'pid': pid,
      'activity': presence.toJson(),
    };
    return request('SET_ACTIVITY', data);
  }

  Future<void> request(
    final String cmd,
    final dynamic args, [
    final dynamic evt,
  ]) async {
    final String nonce = uuid();
    final String data = json.encode(<dynamic, dynamic>{
      'cmd': cmd,
      'args': args,
      'evt': evt,
      'nonce': nonce,
    });
    ws.sink.add(data);
  }

  static Future<DiscordRPC?> connect({
    required final String clientId,
    final int port = 6463,
  }) async {
    final Uri uri = Uri.parse('ws://127.0.0.1:$port/?v=1&client_id=$clientId');
    final WebSocketChannel ws = WebSocketChannel.connect(uri);
    try {
      await ws.ready;
    } catch (error) {
      if (error is SocketException &&
          error.message.contains('Connection refused')) {
        return null;
      }
      rethrow;
    }
    return DiscordRPC(clientId: clientId, port: port, ws: ws);
  }

  static String uuid() => StringUtils.random(inputLength: 32);
}

class DiscordPresence {
  const DiscordPresence({
    this.state,
    this.details,
    this.startTimestamp,
    this.largeImageKey,
    this.largeImageText,
    this.smallImageKey,
    this.smallImageText,
  });

  final String? state;
  final String? details;
  final DateTime? startTimestamp;
  final String? smallImageKey;
  final String? smallImageText;
  final String? largeImageKey;
  final String? largeImageText;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
        'state': state,
        'details': details,
        'timestamps': <dynamic, dynamic>{
          if (startTimestamp != null)
            'start': startTimestamp!.millisecondsSinceEpoch,
        },
        'assets': <dynamic, dynamic>{
          if (smallImageKey != null) 'small_image': smallImageKey,
          if (smallImageText != null) 'small_text': smallImageText,
          if (largeImageKey != null) 'large_image': largeImageKey,
          if (largeImageText != null) 'large_text': largeImageText,
        },
        'instance': false,
      };
}
