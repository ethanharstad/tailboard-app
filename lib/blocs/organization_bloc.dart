import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tailboard_app/blocs/authentication_bloc.dart';
import 'package:tailboard_app/models/organization.dart';
import 'package:tailboard_app/models/user_access.dart';
import 'package:tailboard_app/repositories/organization_repository.dart';
import 'package:tailboard_app/repositories/user_access_repository.dart';

part 'organization_bloc.freezed.dart';

part 'organization_state.dart';

class OrganizationBloc extends Cubit<OrganizationState> {
  final AuthenticationBloc _authenticationBloc;
  final UserAccessRepository _accessRepository;
  final OrganizationRepository _organizationRepository;

  Map<String, UserAccess> accessCache = {};
  Map<String, StreamSubscription<Organization?>> orgListeners = {};
  Map<String, Organization> orgCache = {};

  OrganizationBloc({
    required AuthenticationBloc authenticationBloc,
  })  : _authenticationBloc = authenticationBloc,
        _accessRepository = UserAccessRepository(),
        _organizationRepository = OrganizationRepository(),
        super(const OrganizationState.loading()) {
    _authenticationBloc.stream.listen((authState) {
      if (authState != null) {
        emit(const OrganizationState.loading());
        // Subscribe to access list for current user
        _accessRepository.getUserAccess().listen((List<UserAccess> access) {
          Organization? selected;
          // Update access cache
          Set<String> previousAccess = Set.from(accessCache.keys);
          for(UserAccess a in access) {
            accessCache[a.id] = a;
            previousAccess.remove(a.id);
            if(a.organization == (state as OrganizationsContent).selectedOrganization?.id) {
              selected = (state as OrganizationsContent).selectedOrganization;
            }
            // Resolve organization
            if(!orgListeners.containsKey(a.organization)) {
              orgListeners[a.organization] = _organizationRepository.getOrganization(a.organization).listen((Organization? data) {
                if(data != null) {
                  orgCache[data!.id] = data!;
                  List<Organization> alphabetical = orgCache.values.sorted((Organization a, Organization b) => a.name.compareTo(b.name));
                  emit(OrganizationsContent(
                    selectedOrganization: selected,
                    organizations: alphabetical,
                  ));
                }
              });
            }
          }
          // Clean up revoked access
          for(String toRemove in previousAccess) {
            UserAccess a = accessCache[toRemove]!;
            orgCache.remove(a.organization);
            orgListeners[a.organization]?.cancel();
            orgListeners.remove(a.organization);
            accessCache.remove(toRemove);
          }
        });
      } else {
        emit(const OrganizationState.content());
      }
    });
  }
}
