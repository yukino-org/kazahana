// ignore_for_file: avoid_print

import 'package:discord_rpc/discord_rpc.dart';

Future<void> main() async {
  final DateTime now = DateTime.now();
  const String clientId = '1172183897803603968';
  final DiscordRPC? rpc = await DiscordRPC.connect(clientId: clientId);
  if (rpc == null) {
    print('Could not establish connection to local Discord client');
    return;
  }
  await rpc.setActivity(
    DiscordPresence(
      startTimestamp: now,
      details: 'details',
      state: 'state',
      smallImageText: 'smallImageText',
      smallImageKey: 'yukino-logo',
      largeImageText: 'largeImageText',
      largeImageKey: 'kazahana-logo',
    ),
  );
  print('Updated Discord RPC!');
}
