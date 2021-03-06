class Project
  attr_reader(:title, :id, :name, :project_id, :volunteer_ids)

  def initialize(attr)
    @title = attr[:title]
    @id = attr[:id]
    @volunteer_ids = [attr[:volunteer_ids]]
  end

  def self.all()
    returned_projects = DB.exec("SELECT * FROM projects;")
    projects = []
    returned_projects.each do |project|
      id = project["id"].to_i
      title = project["title"]
      volunteer_ids = project["volunteer_ids"]
      projects.push(Project.new({:id => id, :title => title, :volunteer_ids => volunteer_ids}))
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

  def update(attr)
    @project = Project.find(id.to_i)
    @title = attr.fetch(:title)
    DB.exec("UPDATE projects SET title = '#{title}' WHERE id = #{self.id};")
    @volunteer_ids = attr.fetch(:volunteer_ids, nil)
    if @volunteer_ids != [nil] && @volunteer_ids != nil
      @volunteer_ids.each do |item|
        item = item.to_i
        DB.exec("UPDATE volunteers SET project_id = #{@project.id} WHERE id = #{item};")
      end
    end
  end

  def volunteers
    returned_volunteers = DB.exec("SELECT * FROM volunteers WHERE project_id = #{id};")
    volunteers = []
    returned_volunteers.each do |volunteer|
      id = volunteer["id"].to_i
      name = volunteer["name"]
      volunteers.push(Volunteer.new({:id => id, :name => name}))
    end
    volunteers
  end
end
