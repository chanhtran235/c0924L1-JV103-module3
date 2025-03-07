package com.example.demo_jstl.repository;

import com.example.demo_jstl.model.Student;

import java.util.ArrayList;
import java.util.List;

public class StudentRepository implements IStudentRepository {
    private static List<Student> studentList = new ArrayList<>();
    static {
        studentList.add(new Student(1,"chánh1",true,3,1));
        studentList.add(new Student(2,"Thảo",false,9,1));
        studentList.add(new Student(3,"chánh1",true,6,1));
        studentList.add(new Student(4,"Ngân",false,8,1));
        studentList.add(new Student(5,"chánh1",true,7,1));
    }
    // chuyển kết với DB
    @Override
    public List<Student> findAll() {
        // kết nối DB lấy dữ liêu lên

        return studentList;
    }

    @Override
    public boolean add(Student student) {
        // kết nối DB để thêm dữ liệu vào
        return studentList.add(student);
    }
}
