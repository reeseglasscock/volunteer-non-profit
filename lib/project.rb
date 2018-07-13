class Project
  attr_reader(:title, :id)
  def initialize(attr)
    @title = attr[:title]
    @id = attr[:id]
  end

  def self.all()
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each do |project|
      id = project["id"].to_i
      title = project["title"]
      projects.push(Project.new({:id => id, :title => title}))
    end
    projects
  end

  def ==(another_project)
    binding.pry
    self.title.==(another_project.title)
  end

end
