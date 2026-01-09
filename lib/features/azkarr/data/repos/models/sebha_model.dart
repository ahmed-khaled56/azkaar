class SebhaModel {
  int c1;
  int c2;
  int c3;
  int c4;
  int c5;

  SebhaModel({this.c1 = 0, this.c2 = 0, this.c3 = 0, this.c4 = 0, this.c5 = 0});

  int get total1 => c1 + c2 + c3 + c4 + c5;
}

class recordModel {
  int s1;
  int s2;
  int s3;
  int s4;
  int s5;

  recordModel({
    this.s1 = 0,
    this.s2 = 0,
    this.s3 = 0,
    this.s4 = 0,
    this.s5 = 0,
  });

  int get total2 => s1 + s2 + s3 + s4 + s5;
}
