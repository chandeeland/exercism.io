public class SpaceAge {
  double seconds = 0;

  SpaceAge(double seconds) {
    this.seconds = seconds;
  }

  public double getSeconds() {
    return this.seconds;
  }

  public double onEarth() {
    return this.getSeconds() / 31557600;
  }

  public double onMercury() {
    return this.onEarth() / 0.2408467;
  }

  public double onJupiter() {
    return this.onEarth() / 11.862615;
  }

  public double onSaturn() {
    return this.onEarth() / 29.447498;
  }

  public double onMars() {
    return this.onEarth() / 1.8808158;
  }

  public double onUranus() {
    return this.onEarth() / 84.016846;
  }

  public double onNeptune() {
    return this.onEarth() / 164.79132;
  }

  public double onVenus() {
    return this.onEarth() / 0.61519726;
  }

}
