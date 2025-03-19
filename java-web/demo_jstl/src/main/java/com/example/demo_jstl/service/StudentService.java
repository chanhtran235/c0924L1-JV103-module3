package com.example.demo_jstl.service;

import com.example.demo_jstl.dto.StudentDto;
import com.example.demo_jstl.model.Student;
import com.example.demo_jstl.repository.IStudentRepository;
import com.example.demo_jstl.repository.StudentRepository;

import java.util.ArrayList;
import java.util.List;

public class StudentService implements IStudentService{
    // xử lý nghiệp vụ:
   private IStudentRepository studentRepository = new StudentRepository();
    @Override
    public List<StudentDto> findAll() {
        // không cần xử ly nghiệp vụ => gọi repository => lây list
        // gọi repository ( lấy dữ liệu)
        return studentRepository.findAll();
    }

    @Override
    public List<StudentDto> search(String seachName,String classId) {
        return studentRepository.search(seachName,classId);
    }

    @Override
    public boolean add(Student student) {
        // kiểm tra tính hợp lệ dữ liêu trước khi thêm mới vào csdl
        // validate cho này

        return studentRepository.add(student);

    }

    @Override
    public boolean deleteById(int id) {
        return studentRepository.deleteById(id);
    }
}
