package com.example.demo_jstl.service;

import com.example.demo_jstl.model.Student;
import com.example.demo_jstl.repository.IStudentRepository;
import com.example.demo_jstl.repository.StudentRepository;

import java.util.ArrayList;
import java.util.List;

public class StudentService implements IStudentService{
    // xử lý nghiệp vụ:
   private IStudentRepository studentRepository = new StudentRepository();
    @Override
    public List<Student> findAll() {
        // không cần xử ly nghiệp vụ => gọi repository => lây list
        // gọi repository ( lấy dữ liệu)
        return studentRepository.findAll();
    }

    @Override
    public List<Student> searchByName(String name) {

        return studentRepository.searchByName(name);
    }

    @Override
    public boolean add(Student student) {
        // kiểm tra tính hợp lệ dữ liêu trước khi thêm mới vào csdl
        // validate cho này
        studentRepository.add(student);
        return true;

    }

    @Override
    public boolean deleteById(int id) {
        return studentRepository.deleteById(id);
    }
}
