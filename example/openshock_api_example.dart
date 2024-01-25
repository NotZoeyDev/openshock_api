import 'package:openshock_api/openshock_api.dart';

void main() async {
  final OpenShock client = OpenShock();

  // Log into OpenShock
  await client.account.login(email: '', password: '');

  // Get your user's info and print your name
  final SelfResponse info = await client.users.self();
  print(info.name);

  // Fetch your devices and print their names
  final List<DeviceResponse> devices = await client.devices.all();
  for (final DeviceResponse device in devices) {
    print(device.name);
  }

  // Fetch your shockers and print their names
  final List<DeviceResponseWithShockers> shockers = await client.shockers.all();
  for (final DeviceResponseWithShockers device in shockers) {
    device.shockers?.forEach((ShockerResponse shocker) {
      print(shocker.name);
    });
  }

  // Create a new shocker, edit it and then delete it
  final GuidBaseResponse createdShocker = await client.shockers.create(
    Shocker(rfId: 0, device: devices.first.id, model: ShockerModelType.caixianlin),
  );

  final ShockerWithDevice shocker = await client.shockers.get(createdShocker.data);

  // shocker.data == its id after creation
  await client.shockers.update(
    shocker.id,
    shocker: Shocker(
      rfId: shocker.rfId,
      device: shocker.device,
      model: shocker.model,
      name: 'The shocker 3000',
    ),
  );

  // You can even create a share code for the shocker!
  final GuidBaseResponse shareInfo = await client.shockers.share(
    shocker.id,
    limits: ShockerLimits.maximum(),
    permissions: ShockerPermissions.all(),
  );

  // Add it to your account
  await client.shares.link(shareInfo.data); // NOTE: You cannot link your own share code

  // Delete the share code
  await client.shares.delete(shareInfo.data);

  // You can also create share links.
  final GuidBaseResponse shareLink = await client.links.create(name: 'My very awesome sharelink', expiresOn: DateTime.now().add(Duration(days: 1)));

  // Add the shocker to the share link
  await client.links.link(shareLink.data, shocker.id);

  // Unlink the shocker
  await client.links.unlink(shareLink.data, shocker.id);

  // Delete the shocker
  await client.shockers.delete(shocker.id);

  // Delete the share link
  await client.links.delete(shareLink.data);

  // You can also manage tokens
  final StringBaseResponse createdToken = await client.tokens.create(name: 'Very cool token', permissions: <PermissionType>[PermissionType.shockersUser]);
  final TokenResponse token = await client.tokens.get(createdToken.data!);
  await client.tokens.delete(token.id);
}
