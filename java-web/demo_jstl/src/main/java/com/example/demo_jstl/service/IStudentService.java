package com.example.demo_jstl.service;

import com.example.demo_jstl.model.Student;

import java.util.List;

public interface IStudentService {
    List<Student> findAll();
    List<Student> searchByName(String name);
    boolean add(Student student);
    boolean deleteById(int id);


}
