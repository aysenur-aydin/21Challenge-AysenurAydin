module challenge::day_11;

use std::string::String;
use std::vector;

// Copy Task and TaskStatus from previous days
public enum TaskStatus has copy, drop {
    Open,
    Completed,
}

public struct Task has copy, drop {
    title: String,
    reward: u64,
    status: TaskStatus,
}

public fun new_task(title: String, reward: u64): Task {
    Task {
        title,
        reward,
        status: TaskStatus::Open,
    }
}

// TaskBoard struct with owner and tasks
public struct TaskBoard has drop {
    owner: address,
    tasks: vector<Task>,
}

// Create a new task board
public fun new_board(owner: address): TaskBoard {
    TaskBoard {
        owner,
        tasks: vector::empty(),
    }
}

// Add a task to the board (transfers ownership)
public fun add_task(board: &mut TaskBoard, task: Task) {
    vector::push_back(&mut board.tasks, task);
}
