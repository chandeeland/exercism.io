public class RnaTranscription {
    public static String ofDna(String dna) {
      char[] rna = new char[dna.length()];

      for (int a = 0; a < dna.length(); a++) {
        switch(dna.charAt(a)) {
          case 'G': rna[a] = 'C';
                    break;
          case 'C': rna[a] = 'G';
                    break;
          case 'T': rna[a] = 'A';
                    break;
          case 'A': rna[a] = 'U';
                    break;
        }
      }
      return String.valueOf(rna);
    }
}
