import 'my_dart_entrance.dart';

class Teacher {
  String name;
  int age;
  int salary;
  List<Student> list=[];

  void addStudent(Student stu) {
    list.add(stu);
  }

  Teacher(this.name, this.age, this.salary);

  void teach() {
    print("${name}老师正在教书,学生有：${list}");
  }

  void getSalary() {
    print("${name}老师领了${salary}元钱工资");
  }

  @override
  String toString() {
    return 'Teacher{name: $name, age: $age, solary: $salary}';
  }
}
