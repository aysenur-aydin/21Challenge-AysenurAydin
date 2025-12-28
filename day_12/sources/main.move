module challenge::day_12;

use std::option::{Self, Option};
use std::string::String;
use std::vector;

public enum TaskStatus has copy, drop {
    Open,
    Completed,
}

public struct Task has copy, drop {
    title: String,
    reward: u64,
    status: TaskStatus,
}

public struct TaskBoard has drop {
    owner: address,
    tasks: vector<Task>,
}

public fun new_task(title: String, reward: u64): Task {
    Task {
        title,
        reward,
        status: TaskStatus::Open,
    }
}

public fun new_board(owner: address): TaskBoard {
    TaskBoard {
        owner,
        tasks: vector::empty(),
    }
}

public fun add_task(board: &mut TaskBoard, task: Task) {
    vector::push_back(&mut board.tasks, task);
}

public fun find_task_by_title(board: &TaskBoard, title: &String): Option<u64> {
    let length = vector::length(&board.tasks);
    let mut i = 0;
    while (i < length) {
        let task = vector::borrow(&board.tasks, i);
        if (&task.title == title) {
            return option::some(i)
        };
        i = i + 1;
    };
    option::none()
}
