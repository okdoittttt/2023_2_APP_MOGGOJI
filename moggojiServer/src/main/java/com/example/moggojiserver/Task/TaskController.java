package com.example.moggojiserver.Task;

import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping(path = "/tasks")
public class TaskController {

    @Autowired
    private TaskRepository taskRepository;

    @GetMapping
    public List<TaskItem> getTasks() {
        return taskRepository.findAll();
    }

    @PostMapping(value = "/add")
    public TaskItem assTask(@Valid @RequestBody TaskItem taskItem) {
        return taskRepository.save(taskItem);
    }

    @PutMapping("update/{id}")
    public ResponseEntity updateTask(@PathVariable long id) {
        boolean exist = taskRepository.existsById(id);
//        성공시 실행
        if(exist) {
            TaskItem task = taskRepository.getById(id);
            task.setPwd("Update PWD");
            taskRepository.save(task);

            return new ResponseEntity<>("Task is Update!", HttpStatus.OK);
        }
//        실패시 실행
        return new ResponseEntity<>("Task is not exist!", HttpStatus.BAD_REQUEST);
    }

    @DeleteMapping("/delete/{id}")
    public ResponseEntity deleteTask(@PathVariable Long id) {
        boolean exist = taskRepository.existsById(id);
        if(exist) {
            taskRepository.deleteById(id);
            return new ResponseEntity<>("Task is Delete!", HttpStatus.OK);
        }
        return new ResponseEntity<>("Task is not exist!", HttpStatus.BAD_REQUEST);

    }
}
