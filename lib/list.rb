class List
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_list = DB.exec("SELECT * FROM lists;")
    lists = []
    returned_list.each() do |list|
      name = list.fetch("name")
      id = list.fetch("id").to_i()
      lists.push(List.new({:name => name, :id => id}))
    end
    lists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO lists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_method(:==) do |another_list|
    self.name().==(another_list.name()).&(self.id().==(another_list.id()))
  end

  define_method(:tasks) do
    returned_tasks = DB.exec("SELECT * FROM tasks WHERE list_id = #{self.id}")
    all_tasks = []
    returned_tasks.each() do |tasks|
      description = tasks.fetch("description")
      list_id = tasks.fetch("list_id").to_i()
      all_tasks.push(Task.new({:description => description, :list_id => list_id}))
    end
  all_tasks
  end

  define_singleton_method(:find) do |id|
    found_list = nil
    List.all().each() do |list|
      if list.id().==(id)
        found_list = list
      end
    end
    found_list
  end
end
