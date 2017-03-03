import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

public class Pangrams {
  public static Boolean isPangram(String msg) {
    msg = msg.toLowerCase().replaceAll("[^a-z]","");
    System.out.println(msg);
    System.out.println(msg.length());
    System.out.println(msg.length() == 26);
    Set<String> pangram = new HashSet<>(msg.toCharList().toList());
    return pangram.size() == 26;
  }
}
