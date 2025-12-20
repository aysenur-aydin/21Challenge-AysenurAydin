/// DAY 5: Control Flow & Mark Habit as Done
/// 
/// Today you will:
/// 1. Learn if/else statements
/// 2. Learn how to access vector elements
/// 3. Write a function to mark a habit as completed

module challenge::day_05 {
    use std::vector;

    // Copy from day_04
    public struct Habit has copy, drop {
        name: vector<u8>,
        completed: bool,
    }

    public struct HabitList has drop {
        habits: vector<Habit>,
    }

    public fun new_habit(name: vector<u8>): Habit {
        Habit {
            name,
            completed: false,
        }
    }

    public fun empty_list(): HabitList {
        HabitList {
            habits: vector::empty(),
        }
    }

    public fun add_habit(list: &mut HabitList, habit: Habit) {
        vector::push_back(&mut list.habits, habit);
    }

    public fun complete_habit(list: &mut HabitList, index: u64) {
        let vector_length = vector::length(&list.habits);
        if (index < vector_length) {
            let habit = vector::borrow_mut(&mut list.habits, index);
            habit.completed = true;
        }
    }
}

