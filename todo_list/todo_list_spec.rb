require 'todo_list'

describe "TodoList" do
  before do
    @list = TodoList.new
  end

  it "returns the list" do
    @list.list.should == []
  end

  it "can add a task" do
    @list.add("Get Milk")
    @list.list.should == ["Get Milk"]
  end

  it "won't add a task without a description" do
    expect {
      @list.add()
    }.to raise_exception
  end

  it "can check off a task" do
    @list.add("Get Milk")
    @list.check_off(1)
    @list.list.should == []
  end

  it "does not display checked off tasks" do
    @list.add("Get Milk")
    @list.add("Get Bread")
    @list.check_off(1)
    @list.output.should == "To Do List\n1. Get Bread\n"
  end

  it "can edit a description" do
    @list.add("Get Mlik")
    @list.edit_item(1,"Get Milk")
    @list.list.should == ["Get Milk"]
  end

  it "checks off an item when edited to an empty description" do
    @list.add("Get Milk")
    @list.edit_item(1)
    @list.list.should == []
  end

  it "does not edit an item if the index is invalid" do
    @list.add("Get Mlik")
    @list.edit_item(2,"Get Milk")
    @list.edit_item(0,"Get Milk")
    @list.list.should == ["Get Mlik"]
  end

end
