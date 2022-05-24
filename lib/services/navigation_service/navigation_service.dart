class NavigationService {
  String paramSplitter = "-84_49-";

  String paramEncode(List<String> paramList) {
    String decodedString = paramSplitter;
    for (String param in paramList) {
      String paramString = (param == '') ? "__" : param;
      decodedString = decodedString + paramString + paramSplitter;
    }
    return decodedString;
  }

  void removeSpace(List<String> paramList) {
    for (var i = 0; i < paramList.length; i++) {
      paramList[i] = (paramList[i] == "__") ? "" : paramList[i];
    }
  }

  List<String> paramDecode(String pathParam) {
    List<String> paramList = pathParam.split(paramSplitter);
    removeSpace(paramList);
    paramList.removeAt(0);
    paramList.removeLast();
    return paramList;
  }
}
