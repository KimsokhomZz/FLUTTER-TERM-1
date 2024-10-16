class Distance {
  final double cmDuration;
  final double mDuration;
  final double kmDuration;

  const Distance(this.cmDuration, this.mDuration, this.kmDuration);

  factory Distance.cms(double cms) => Distance(cms, 0, 0);
  factory Distance.meters(double meters) => Distance(0, meters, 0);
  factory Distance.kms(double kms) => Distance(0, 0, kms);

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
  print((d1 + d2).km);

  Distance d = Distance(10, 0.5, 4);
  print(d.mDuration);
  print(d.cm);
}
