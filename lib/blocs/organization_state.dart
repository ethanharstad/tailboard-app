part of 'organization_bloc.dart';

@freezed
class OrganizationState with _$OrganizationState {
  const factory OrganizationState.loading() = OrganizationsLoading;
  const factory OrganizationState.content({
    @Default([]) List<Organization> organizations,
    Organization? selectedOrganization,
  }) = OrganizationsContent;
}
