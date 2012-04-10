class TodoList

  attr_reader :list

  def initialize
    @list = []
    output()
  end

  def list
    @list
  end

  def add(description)
    @list << description
  end

  def check_off(index)
    @list.delete_at(index-1)
  end

  def output
    display = "To Do List\n"
    @list.each_with_index do |item,index|
      display << (index + 1).to_s + ". " + item  + "\n"
    end
    puts display
    return display
  end

  def web_output
    display = "<strong>To Do List</strong><br /><ol>"
    @list.each_with_index do |item,index|
      display << "<li>" + item  + " <a href='/edit?index=#{index + 1}'>Edit</a> <a href='/check?index=#{index + 1}'>Check Off</a></li>"
    end
    display << "</ol>"
    return display
  end

  def edit_item(index, description='')
    index = index.to_i
    if index <= 0 || index > @list.length
      puts "Invalid Item"
    else
      if description.empty?
        check_off(index)
      else
        @list[index.to_i - 1] = description
      end
    end
  end

  def get_actions()

  end

  def get_web_input(params)
    command = params[:command]
    if entry[/\Aa\z/]
      description = params[:description]
      puts "What would you like to add?\n"
      item = gets
      add(item.chomp)
    elsif entry[/\Ae\z/]
      puts "What item would you like to edit\n"
      index = gets
      puts "What would you like to change it to?\n"
      description = gets
      edit_item(index, description.chomp)
    elsif entry[/\A\d+\z/]
      check_off(entry.to_i)
    elsif entry[/\Aq\z/]
      puts "Goodbye"
      return
    else
      puts "Command not Recognized\n"
    end
  end

  def get_input
    entry = gets.chomp
    if entry[/\Aa\z/]
      puts "What would you like to add?\n"
      item = gets
      add(item.chomp)
    elsif entry[/\Ae\z/]
      puts "What item would you like to edit\n"
      index = gets
      puts "What would you like to change it to?\n"
      description = gets
      edit_item(index, description.chomp)
    elsif entry[/\A\d+\z/]
       check_off(entry.to_i)
    elsif entry[/\Aq\z/]
      puts "Goodbye"
      return
    else
      puts "Command not Recognized\n"
    end

    output()
    get_input()
  end

end