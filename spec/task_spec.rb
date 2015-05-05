require('spec_helper')

describe(Task) do

  describe("#description") do
    it("lets you give it a description") do
      test_task = Task.new({:description => "scrub the zebra", :list_id => 1, :due => '2012-01-01', :id => nil})
      expect(test_task.description()).to(eq("scrub the zebra"))
    end
  end

  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("is the same task if it has the same description") do
      task1 = Task.new({:description => "scrub the zebra", :list_id => 1, :due => '2012-01-01', :id => nil})
      task2 = Task.new({:description => "scrub the zebra", :list_id => 1, :due => '2012-01-01', :id => nil})

      expect(task1).to(eq(task2))
    end
  end

  describe("#save") do
    it("adds a task to the array of saved tasks") do
      test_task = Task.new({:description => "scrub the zebra", :list_id => 1, :due => '2012-01-01', :id => nil})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end

  describe('#list_id') do
    it("lets you read the list ID") do
      test_task = Task.new({:description => "scrub the zebra", :list_id => 1, :due => '2012-01-01', :id => nil})
      expect(test_task.list_id()).to(eq(1))
    end
  end

  describe('#due') do
    it("lets you read the due date") do
      test_task = Task.new({:description => "scrub the zebra", :list_id => 1, :due => '2012-01-01', :id => nil})
      expect(test_task.due).to(eq('2012-01-01'))
    end
  end
end
