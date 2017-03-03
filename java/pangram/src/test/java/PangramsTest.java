import org.junit.Test;
import org.junit.Ignore;

import static org.junit.Assert.assertTrue;
import static org.junit.Assert.assertFalse;

public class PangramsTest {


    @Test
    public void emptySentenceIsNotPangram() {
        assertFalse(Pangrams.isPangram(""));
    }

    @Test
    public void pangramWithOnlyLowerCaseLettersIsRecognizedAsPangram() {
        assertTrue(Pangrams.isPangram("the quick brown fox jumps over the lazy dog"));
    }

    @Test
    public void phraseMissingCharacterXIsNotPangram() {
        assertFalse(Pangrams.isPangram("a quick movement of the enemy will jeopardize five gunboats"));
    }

    @Test
    public void anotherPhraseMissingCharacterXIsNotPangram() {
        assertFalse(Pangrams.isPangram("the quick brown fish jumps over the lazy dog"));
    }

    @Test
    public void pangramWithUnderscoresIsRecognizedAsPangram() {
        assertTrue(Pangrams.isPangram("\"the_quick_brown_fox_jumps_over_the_lazy_dog\""));
    }

    @Test
    public void pangramWithNumbersIsRecognizedAsPangram() {
        assertTrue(Pangrams.isPangram("\"the 1 quick brown fox jumps over the 2 lazy dogs\""));
    }

    @Test
    public void phraseWithMissingLettersReplacedByNumbersIsNotPangram() {
        assertFalse(Pangrams.isPangram("\"7h3 qu1ck brown fox jumps ov3r 7h3 lazy dog\""));
    }

    @Test
    public void pangramWithMixedCaseAndPunctuationIsRecognizedAsPangram() {
        assertTrue(Pangrams.isPangram("\"Five quacking Zephyrs jolt my wax bed.\""));
    }

    @Test
    public void pangramWithNonAsciiCharactersIsRecognizedAsPangram() {
        assertTrue(Pangrams.isPangram("Victor jagt zwölf Boxkämpfer quer über den großen Sylter Deich."));
    }


    @Test
    public void panagramInAlphabetOtherThanAsciiIsNotRecognizedAsPangram() {
        assertFalse(Pangrams.isPangram("Широкая электрификация южных губерний даст мощный толчок подъёму сельского хозяйства."));
    }

    @Test
    public void upperAndLowerCaseVersionsOfTheSameCharacterShouldNotBeCountedSeparately() {
        assertFalse(Pangrams.isPangram("the quick brown fox jumped over the lazy FOX"));
    }
}
