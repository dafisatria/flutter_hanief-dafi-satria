abstract class Shape {
  double getArea() {
    return 0;
  }

  double getPerimeter() {
    return 0;
  }
}

class Circle implements Shape {
  late int radius;
  Circle(this.radius);
  @override
  double getArea() {
    return 3.14 * (radius * radius);
  }

  @override
  double getPerimeter() {
    return 2 * 3.14 * radius;
  }
}

class Square implements Shape {
  late int side;
  Square(this.side);
  @override
  double getArea() {
    int area = side * side;
    return area.toDouble();
  }

  @override
  double getPerimeter() {
    int perimeter = 4 * side;
    return perimeter.toDouble();
  }
}

class Rectangle implements Shape {
  late int width, height;
  Rectangle(this.width, this.height);
  @override
  double getArea() {
    int area = width * height;
    return area.toDouble();
  }

  @override
  double getPerimeter() {
    int perimeter = 2 * (height + width);
    return perimeter.toDouble();
  }
}

void main() {
  Circle lingkaran = Circle(7);
  print('luas lingkaran : ${lingkaran.getArea()}');
  print('keliling lingkaran : ${lingkaran.getPerimeter()}\n');
  Square persegi = Square(5);
  print('luas persegi : ${persegi.getArea().toInt()}');
  print('keliling persegi : ${persegi.getPerimeter().toInt()}\n');
  Rectangle persegiPanjang = Rectangle(4, 6);
  print('luas persegi panjang : ${persegiPanjang.getArea().toInt()}');
  print(
      'keliling persegi panjang : ${persegiPanjang.getPerimeter().toInt()}\n');
}
