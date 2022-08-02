extension NumberPercision on double {
  bool equalsAsMinimumPrecision(double other) {
    bool isEqual = false;
    int fractionMainPrecision =
        (this - roundToDouble()).toString().split('.')[1].length;
    int fractionOtherPrecision =
        (other - other.roundToDouble()).toString().split('.')[1].length;

    if (fractionMainPrecision >= fractionOtherPrecision) {
      isEqual = toStringAsFixed(fractionOtherPrecision) ==
          other.toStringAsFixed(fractionOtherPrecision);
    } else {
      isEqual = toStringAsFixed(fractionMainPrecision) ==
          other.toStringAsFixed(fractionMainPrecision);
    }
    return isEqual;
  }
}
