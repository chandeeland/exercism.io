import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.time.ZoneOffset;

public class Gigasecond {
  long start;
  ZoneId zone;
  ZoneOffset offset;

  Gigasecond(LocalDateTime s) {
    this.zone = ZoneId.systemDefault();
    this.offset = s.atZone(this.zone).getOffset();
    this.start = s.atZone(this.zone).toEpochSecond();
  }

  Gigasecond(LocalDate s) {
    this.zone = ZoneId.systemDefault();
    this.offset = s.atStartOfDay(this.zone).getOffset();
    this.start = s.atStartOfDay(this.zone).toEpochSecond();
  }

  public LocalDateTime getDate() {
    return LocalDateTime.ofEpochSecond(this.start + 1000000000, 0, this.offset);
  }
}
