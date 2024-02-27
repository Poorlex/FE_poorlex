Map<String, RegExp> regexes = {
  // 'nickname': new RegExp(r'^([A-Za-z0-9-_]{2,20})$'),
  'nickname': RegExp(r'^[ㄱ-ㅎ-ㅣ가-힣A-Za-z0-9-_ ]{2,20}$'),
};

bool checkRegex (String n, String v) {
  return regexes[n]?.hasMatch(v) ?? false;
}

