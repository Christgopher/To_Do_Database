require('spec_helper')

describe(List) do
  describe(".all") do
    it("starts off with no lists") do
      expect(List.all()).to(eq([]))
    end
  end

  describe("#name") do
    it("tells you its name") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      expect(list.name()).to(eq("Epicodus stuff"))
    end
  end

  describe("#id") do
    it("sets its ID when you save it") do
      list = List.new({:name => "Epicodus stuff", :id => nil})
      list.save()
      expect(list.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#==") do
    it("is the same list if it has the same name") do
      list1 = List.new({:name => "Epicodus stuff", :id => nil})
      list2 = List.new({:name => "Epicodus stuff", :id => nil})
      expect(list1).to(eq(list2))
    end
  end

  describe("#save") do
    it("lets you save lists to the database") do
      list = List.new({:name => "learn SQL", :id => nil})
      list.save()
      expect(List.all()).to(eq([list]))
    end
  end

  describe("#tasks") do
    it("shows all tasks in a list") do
      list1 = List.new({:name => "zebra things", :id => nil})
      list1.save()
      task1 = Task.new({:description => "scrub the zebra", :list_id => list1.id, :due => '2012-01-01', :id => nil})
      task2 = Task.new({:description => "eat zebra", :list_id => list1.id, :due => '2012-01-01', :id => nil})
      task1.save()
      task2.save()
      expect(list1.tasks()).to(eq([task1, task2]))
    end
  end

  describe(".find") do
    it("returns a list by its ID") do
      test_list = List.new({:name => "Epicodus stuff", :id => nil})
      test_list.save()
      test_list2 = List.new({:name => "Home stuff", :id => nil})
      test_list2.save()
      expect(List.find(test_list2.id())).to(eq(test_list2))
    end
  end
end
