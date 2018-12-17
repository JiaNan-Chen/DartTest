import 'Teacher.dart';
import 'dart:async';
import 'dart:math';
import 'dart:core';

main(List<String> mList) async {
  if (mList != null) print(mList);

  var smallZhou = new Student("周紫倩", 10);
  var bigZhou = new BigStudent("周紫倩", 20);

  smallZhou.study();
  bigZhou.study();

  dynamic isTrue = true;
  //  Object isTrue=true;
  //  var isTrue=true;

  if (isTrue) {
    print("true");
  }

  int num = 1;
  //  int num;抛异常
  num.abs();

  //  flnal 或者 const 不能和 var 同时使用
//  final fNum = 1;
  const fNum = 1;
//  fNum = 2;

  Test.main();
  new Test()._id = 3;

  var list = const [10, 20, 30];
//  list[1]=2;exception
  print(list[0]);
  print(list[1]);
  print(list[2]);

  final finalList = [1, 2, 3, 4, 5, 6];
  finalList[4] = 100;
  print(finalList[4]);

  const constList = const [10, 11111, 13, 1];
  print(constList[1]);

  Student stu = new BigStudent("周周", 20);
  (stu as BigStudent).study();
  stu.study();

  (stu as BigStudent).beBeautiful();

  if (stu is BigStudent) {
    stu.beBeautiful();
  }

  if (stu is! double) {
    print(stu);
  }

  //你可以使用=运算符赋值。要仅在变量为null时赋值，请使用??=运算符
  int i;
  i = 1;
  i ??= 8;
//  assert(i != 1);断言 生产代码中将忽略assert()调用。在开发期间，assert(condition)抛出异常，除非条件为真。
  print(i);

  var age = 101010;
//  var age;
  print(age ?? "asas");

  //级联符号(..)
  if (stu is BigStudent)
    stu
      ..name = "傻子周大生"
      ..age = 21
      ..study()
      ..study()
      ..beBeautiful()
      ..beBeautiful();
  smallZhou.study();

  smallZhou._id = "11";

  smallZhou._privateFun();

  var sb = new StringBuffer();
  sb..write("qqq")..write("qwqwqw");
  print(sb);

  var str = "assas" "asas12" 'q' 'q' "1212";
  print(str);

  var teacher = new Teacher("迦南", 22, 100);
  teacher.addStudent(bigZhou);
  teacher.teach();
  teacher.getSalary();

  var map = {1: "one", "2": "second", true: "True"};
  print(map[1]);
  print(map["2"]);
  print(map[true]);

  Runes input = new Runes(
      '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}');
  print(new String.fromCharCodes(input));

//  bigZhou.name=null;
  print(bigZhou.getStuName());

//  方法作为一等对象
//  你可以将函数作为参数传递给另一个函数。
  var l = ["one", "two", "three"];
  l.forEach(mPrint);
  print("-----------------分割线---------------");
  //匿名函数
  l.forEach((it) {
    print(it);
  });
  print("-----------------分割线---------------");
  //匿名函数
  l.forEach((it) {
    if (it == "three") return;
    print(it);
  });
  print("-----------------分割线---------------");
  //如果函数只包含一条语句，可以使用箭头符号来缩短它
  l.forEach((it) => mPrint(it));

  void interFun() {
    var interZhou = new BigStudent("猪猪女孩", 18);
    print(smallZhou);
    print(bigZhou);
    print(interZhou);
  }

  void calculate() {
    try {
      double i = 4 / 0;
      print(i);
      throwException();
    } on Exception catch (e) {
      print(e);
    } catch (e) {
      print(e);
//      rethrow;
    } finally {
      print("error happened");
    }
  }

// var stu2=const Student("不愿意透露姓名的陈某某", 22);

  calculate();
  interFun();

  Human human = new Human();
  human.sleep();

  printNum("李静桦");
  await printNum1("周紫倩");
  print("ending");

  var now = new DateTime.now();
  print(now);
}

Future printNum(String name) async {
  for (int i = 0; i < 10000; i++) {
    print("${name}迭代第${i}次");
  }
}

Future printNum1(String name) async {
  for (int i = 0; i < 10000; i++) {
    print("${name}迭代第${i}次");
  }
}

void throwException() {
  throw "qwqw";
}

void mPrint(String str) {
  print(str);
}

class ConstObject {
  final int x;
  final int y;

//  int z;

  const ConstObject(this.x, this.y);
}

class Student {
  String name;
  int age;

  Student.build(this.name, this.age, this._id); //无效

  String _id;

  Student(this.name, this.age);

//  对于只包含一个表达式的函数，可以使用速记语法:
//  bool isNoble(int atomicNumber) => _nobleGases[atomicNumber] != null;
//
//  => expr语法是{return expr；}。=>符号有时被称为箭头语法。
//
//  注意：只有表达式（而不是语句！）可以存在于箭头( => )和分号(;)之间。 例如，你不能使用if语句，但可以用条件表达式。

  String getStuName() => name;

  void study() {
    print("${age}岁的${name}准时起床，认真听讲");
  }

  //无效
  void _privateFun() {
    print("private");
  }

  @override
  String toString() {
    return 'Student{name: $name, age: $age}';
  }
}

class BigStudent extends Student {
  BigStudent(String name, int age) : super(name, age);

  @override
  void study() {
    print("${age}岁的${name}还在睡觉");
  }

  bool beBeautiful() {
    print("${name}又在化妆了！！！");
    return true;
  }
}

class Test {
  static const name = "test";
  int _id;

  static main() {
    //这里会报错：Undefined name 'static'
    //static类型的变量是属于类的所以在类里面，方法之外
    const name = "test";
  }
}
