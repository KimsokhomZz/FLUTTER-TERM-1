class Distance {
  final double cmDuration;
  final double mDuration;
  final double kmDuration;

  const Distance(this.cmDuration, this.mDuration, this.kmDuration);

  const Distance.cms(double cms)
      : this.cmDuration = cms,
        this.mDuration = 0,
        this.kmDuration = 0;
  const Distance.meters(double meters)
      : this.mDuration = meters,
        this.cmDuration = 0,
        this.kmDuration = 0;
  const Distance.kms(double kms)
      : this.kmDuration = kms,
        this.cmDuration = 0,
        this.mDuration = 0;

  Distance operator +(Distance distance) {
    return Distance.meters(this.toMeter() + distance.toMeter());
  }

  double get cm => toMeter() * 100;
  double get meter => toMeter();
  double get km => toMeter() / 1000;

  double toMeter() {
    double meterResult =
        (this.cmDuration / 100) + this.mDuration + (this.kmDuration * 1000);
    return meterResult;
  }
}

void main() {
  Distance d1 = Distance.kms(3.4);
  Distance d2 = Distance.meters(1000);
  print((d1 + d2).cm);

  Distance d = Distance(10, 0.2, 4);
  print(d.mDuration);
  print(d.cm);
}
