class ExceptionUtility {
  static String getDescriptionError (Object exception) {
    if (exception is Exception) {
      Exception error = exception;
      String descError = error.toString().split(':')[3].trim().replaceAll("}", "");
      return descError;
    } else {
      return "Desculpe, mas não foi possível concluir o processo.";
    }
  }
}