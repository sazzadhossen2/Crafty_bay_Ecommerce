class ResponceData {
  bool isSuccess;
  int statusCode;
  dynamic responceData;
  String isError;

  ResponceData(
      {required this.isSuccess,
      required this.statusCode,
      required this.responceData,
      this.isError = 'Something Wrong'});
}
