require_relative '../lib/task.rb'
require_relative '../lib/task_list.rb'
require_relative '../lib/task_formatter.rb'

RSpec.describe "tasks integration" do
  it "adds tasks to a list" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    expect(task_list.all).to eq [task_1, task_2]
  end

  it "marks tasks as complete" do
    task_list = TaskList.new
    task_1 = Task.new("Walk the dog")
    task_2 = Task.new("Walk the cat")
    task_list.add(task_1)
    task_list.add(task_2)
    task_1.mark_complete
    task_2.mark_complete
    expect(task_list.all_complete?).to eq true
  end
<<<<<<< HEAD:mocking_bites/challenge/spec/tasks_integration_spec.rb
end
=======

  context "task is incomplete" do
    it "formats the task as a string" do
      task_list = TaskList.new
      task_1 = Task.new("Task 1")
      task_list.add(task_1)
      task_formatter = TaskFormatter.new(task_1)
      expect(task_formatter.format).to eq "- [ ] Task 1"
    end
  end

  context "task is complete" do
    it "formats the task as a string" do
      task_list = TaskList.new
      task_1 = Task.new("Task 1")
      task_1.mark_complete
      task_list.add(task_1)
      task_formatter = TaskFormatter.new(task_1)
      expect(task_formatter.format).to eq "- [x] Task 1"
    end
  end
  
end
>>>>>>> 763a79b (created unit tests for peer classes and additional integration tests):phase_3_mocking_bites/mocking_bites_challenge/spec/tasks_integration_spec.rb
