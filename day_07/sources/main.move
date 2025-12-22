module challenge::day_07 {
    use std::vector;
    use std::string::{Self, String};

    public struct Habit has copy, drop {
        name: String,
        completed: bool,
    }

    public struct HabitList has drop {
        habits: vector<Habit>,
    }

    public fun new_habit(name: String): Habit {
        Habit {
            name,
            completed: false,
        }
    }

    public fun make_habit(name_bytes: vector<u8>): Habit {
        let name = string::utf8(name_bytes);
        new_habit(name)
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
        let len = vector::length(&list.habits);
        if (index < len) {
            let habit = vector::borrow_mut(&mut list.habits, index);
            habit.completed = true;
        }
    }

    #[test]
    fun test_add_habits() {
        let mut list = empty_list();

        let habit_1 = new_habit(b"Run".to_string());
        let habit_2 = new_habit(b"Code".to_string());

        add_habit(&mut list, habit_1);
        add_habit(&mut list, habit_2);

        let length = vector::length(&list.habits);
        assert!(length == 2, 0);
    }

    #[test]
    fun test_complete_habit() {
        let mut list = empty_list();

        let habit = new_habit(b"Run".to_string());
        add_habit(&mut list, habit);

        complete_habit(&mut list, 0);

        let completed_habit = vector::borrow(&list.habits, 0);
        assert!(completed_habit.completed == true, 0);
    }
}

