import 'profile.dart';

class ProfileFlowArgs {
  const ProfileFlowArgs({this.editMode = false, this.profile});

  final bool editMode;
  final Profile? profile;
}
