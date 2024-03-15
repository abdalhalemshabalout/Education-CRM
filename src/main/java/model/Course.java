package model;

public class Course {
    private int id;
    private String CourseName;
    private String StartDate;
    private String EndDate;
    private String Description;
    private String Department;

    // Constructors
    public Course() {
    }

    public Course(int id, String CourseName, String StartDate, String EndDate, String Description, String Department) {
        this.id = id;
        this.CourseName = CourseName;
        this.StartDate = StartDate;
        this.EndDate = EndDate;
        this.Description = Description;
        this.Department = Department;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getCourseName() {
        return CourseName;
    }

    public void setCourseName(String CourseName) {
        this.CourseName = CourseName;
    }

    public String getStartDate() {
        return StartDate;
    }

    public void setStartDate(String StartDate) {
        this.StartDate = StartDate;
    }

    public String getEndDate() {
        return EndDate;
    }

    public void setEndDate(String EndDate) {
        this.EndDate = EndDate;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public String getDepartment() {
        return Department;
    }

    public void setDepartment(String Department) {
        this.Department = Department;
    }
}
