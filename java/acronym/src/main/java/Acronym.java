public class Acronym {
  public static String generate(String phrase) {
    int i = 0;
    char curr;
    boolean appendNext = true;
    StringBuilder acronym = new StringBuilder();

    while (i < phrase.length()) {
      curr = phrase.charAt(i);
      //
      // if (appendNext == false && Character.toUpperCase(curr) == curr) {
      //   appendNext = true;
      // }

      if (appendNext == true) {
        acronym.append(curr);
        appendNext = false;
      }
      if (curr == ' ' || curr == '-') {
        appendNext = true;
      }
      i++;
    }

    return acronym.toString().toUpperCase();
  }
}
