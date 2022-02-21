extension ApiStateExtension on ApiState {
  bool get isLoading => this == ApiState.loading;

  bool get isInitial => this == ApiState.initial;

  bool get isError => this == ApiState.error;

  bool get isHasData => this == ApiState.hasData;

  bool get isNoData => this == ApiState.noData;
}

enum ApiState {
  initial,
  loading,
  error,
  noData,
  hasData,
}
