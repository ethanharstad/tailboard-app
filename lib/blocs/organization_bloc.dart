import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tailboard_app/blocs/authentication_bloc.dart';
import 'package:tailboard_app/models/organization.dart';
import 'package:tailboard_app/repositories/organization_repository.dart';
import 'package:tailboard_app/repositories/user_access_repository.dart';

part 'organization_state.dart';

part 'organization_bloc.freezed.dart';

class OrganizationBloc extends Cubit<OrganizationState> {
  final AuthenticationBloc _authenticationBloc;
  final UserAccessRepository _accessRepository;
  final OrganizationRepository _organizationRepository;

  OrganizationBloc({
    required AuthenticationBloc authenticationBloc,
  })  : _authenticationBloc = authenticationBloc,
        _accessRepository = UserAccessRepository(),
        _organizationRepository = OrganizationRepository(),
        super(const OrganizationState.loading()) {
    _authenticationBloc.stream.listen((authState) {
      if (authState != null) {

      }
      else {
        emit(const OrganizationState.content());
      }
    });
  }
}
