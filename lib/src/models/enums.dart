import 'package:json_annotation/json_annotation.dart';

@JsonEnum(valueField: 'name')
enum RankType {
  user('User'),
  support('Support'),
  staff('Staff'),
  admin('Admin'),
  system('System');

  const RankType(this.name);
  final String name;
}

@JsonEnum(valueField: 'name')
enum ShockerModelType {
  caixianlin('CaiXianlin'),
  petrainer('PetTrainer');

  const ShockerModelType(this.name);
  final String name;
}

@JsonEnum(valueField: 'type')
enum ControlType {
  stop('Stop'),
  shock('Shock'),
  vibrate('Vibrate'),
  sound('Sound');

  const ControlType(this.type);
  final String type;
}

@JsonEnum(valueField: 'reason')
enum PauseReason {
  none('None'),
  shocker('Shocker'),
  share('Share'),
  shareLink('ShareLink');

  const PauseReason(this.reason);
  final String reason;
}

@JsonEnum(valueField: 'type')
enum PermissionType {
  shockersUser('Shockers_Use');

  const PermissionType(this.type);
  final String type;
}
