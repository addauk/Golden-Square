require_relative '../lib/task_formatter.rb'

RSpec.describe TaskFormatter do

  context "task is incomplete" do
    it "formats the task as a string" do
      fake_task = double(:fake_task, title: "Task 1", complete?: false)
      # expect(fake_task).to receive(:title).and_return("Task 1")
      # expect(fake_task).to receive(:complete?).and_return(false)
      task_formatter = TaskFormatter.new(fake_task)
      expect(task_formatter.format).to eq "- [ ] Task 1"
    end
  end

  context "task is complete" do
    it "formats the task as a string" do
      fake_task = double(:fake_task, title: "Task 1", complete?: true)
      task_formatter = TaskFormatter.new(fake_task)
      expect(task_formatter.format).to eq "- [x] Task 1"
    end
  end

end