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
    self.title.==(another_project.title)
  end

  def save
    result = DB.exec("INSERT INTO projects (title) VALUES ('#{title}') RETURNING id;")
    @id = result.first["id"].to_i
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{self.id};")
  end

  def self.find(id)
    return_project = DB.exec("SELECT * FROM projects WHERE id = #{id};")
    id = return_project.first["id"].to_i
    title = return_project.first["title"]
    project = Project.new({:title => title, :id => id})
  end

end
