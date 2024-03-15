package model;

public class Lesson {
    private int id;
    private String LessonName;
    private String StartTime;
    private String EndTime;
    private String Classroom;
    private String Department;


    // Constructors
    public Lesson() {
    }

    public Lesson(int id, String LessonName,String StartTime, String EndTime, String Classroom, String Department) {
        this.id = id;
        this.LessonName = LessonName;
        this.StartTime = StartTime;
        this.EndTime = EndTime;
        this.Classroom = Classroom;
        this.Department = Department;

    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getLessonName() {
        return LessonName;
    }

    public void setLessonName(String LessonName) {
        this.LessonName = LessonName;
    }
    public String getStartTime() {
        return StartTime;
    }

    public void setStartTime(String StartTime) {
        this.StartTime = StartTime;
    }
    public String getEndTime() {
        return EndTime;
    }

    public void setEndTime(String EndTime) {
        this.EndTime = EndTime;
    }
    public String getClassroom() {
        return Classroom;
    }

    public void setClassroom(String Classroom) {
        this.Classroom = Classroom;
    }
    public String getDepartment() {
        return Department;
    }

    public void setDepartment(String Department) {
        this.Department = Department;
    }
}
