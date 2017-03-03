public class Hamming {
  public static int compute(String a, String b) {
    int distance = 0;
    if (a.length() != b.length()) {
      throw new IllegalArgumentException();
    }
    for (int i = 0; i < a.length(); i++) {
      if (a.charAt(i) != b.charAt(i)) {
        distance++;
      }
    }
    return distance;
  }
}
