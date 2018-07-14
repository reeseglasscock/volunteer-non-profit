class Volunteer
  attr_reader(:name, :id, :project_id, :title)

  def initialize(attr)
    @name = attr[:name]
    @id = attr[:id]
    @project_id = attr[:project_id]
  end

  def self.all()
    returned_volunteers = DB.exec("SELECT * FROM volunteers;")
    volunteers = []
    returned_volunteers.each do |volunteer|
      id = volunteer["id"].to_i
      name = volunteer["name"]
      project_id = volunteer["project_id"].to_i
      volunteers.push(Volunteer.new({:id => id, :name => name, :project_id => project_id}))
    end
    volunteers
  end

  def ==(another_volunteer)
    self.name.==(another_volunteer.name)
  end

  def save
    result = DB.exec("INSERT INTO volunteers (name, project_id) VALUES ('#{name}', #{project_id}) RETURNING id;")
    @id = result.first["id"].to_i
  end

  def delete
    DB.exec("DELETE FROM volunteers WHERE id = #{self.id};")
  end

  def self.find(id)
    return_volunteer = DB.exec("SELECT * FROM volunteers WHERE id = #{id};")
    id = return_volunteer.first["id"].to_i
    name = return_volunteer.first["name"]
    project_id = return_volunteer.first["project_id"]
    volunteer = Volunteer.new({:name => name, :id => id, :project_id => project_id})
  end

  def update(attr)
    @name = attr.fetch(:name)
    @project_id = attr.fetch(:project_id)
    DB.exec("UPDATE volunteers SET name = '#{name}' WHERE id = #{self.id};")
    DB.exec("UPDATE volunteers SET project_id = #{project_id} WHERE id = #{self.id};")
  end


end
