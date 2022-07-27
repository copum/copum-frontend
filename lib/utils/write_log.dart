class WriteLog {
  static final WriteLog _instance = WriteLog._internal();

  factory WriteLog() {
    return _instance;
  }

  WriteLog._internal() {}
}
