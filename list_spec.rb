require "rspec"

require_relative "list"

describe List do
  let(:title) {"Happiness is a warm gun"}
  
  let(:incomplete_task) do
    task = mock(:task)
    task.stub(:complete? => false)
    task.stub(:complete! => true)
    task
  end

  let(:complete_task) do
    task = mock(:task)
    task.stub(:complete? => true)
    task
  end

  let(:list) {List.new(title, [incomplete_task, complete_task])}


  describe '#title' do
    it 'returns correct title for the list' do
      expect(list.title).to eq(title)
    end
  end

  describe '#tasks' do
    it 'returns an array' do
      expect(list.tasks).to be_an_instance_of Array
    end
  end

  describe 'initialize' do
    it 'takes a title as its first argument' do
      expect(List.new('Movies to watch')).to be_an_instance_of List
    end
    it 'requires one or two arguments' do
      expect{ List.new }.to raise_error
    end
  end

  describe '#add_task' do
    it 'adds a task to the list' do
      expect { list.add_task('task3') }.to change { list.tasks.length }.by(1)
    end
  end

  describe '#complete_task' do
    it 'returns true for a successfully completed task' do
      list.stub(tasks: [incomplete_task])
      expect(list.complete_task(0)).to eq(true)
    end
  end

  describe '#delete_task' do
    it 'removes a task from the list' do
      task = list.tasks[0]
      list.delete_task(0)
      expect(list.tasks).not_to include(task)
    end
  end

  describe '#completed_tasks' do
    it 'returns completed tasks' do
      expect(list.completed_tasks).to eq [complete_task]
    end
  end

  describe '#incomplete_tasks' do
    it 'returns incomplete tasks' do
      expect(list.incomplete_tasks).to eq [incomplete_task]
    end
  end
end
