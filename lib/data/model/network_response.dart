class NetworkResponse {
  final bool isSuccess;
  final int? responseCode;
  final String errorMessage;
  final dynamic responseData;

  NetworkResponse(
      {required this.isSuccess,
      required this.responseCode,
      this.errorMessage = 'Something went wrong',
      this.responseData});
}
