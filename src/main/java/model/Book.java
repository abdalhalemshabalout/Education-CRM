package model;

public class Book {
    private int id;
    private String title;
    private String author;
    private String publicationDate;
    private String genre;
    private String publisher;
    private int pages;
    private int available;

    public Book() {
    }

    public Book(int id, String title, String author, String publicationDate, String genre, String publisher, int pages, int available) {
        this.id = id;
        this.title = title;
        this.author = author;
        this.publicationDate = publicationDate;
        this.genre = genre;
        this.publisher = publisher;
        this.pages = pages;
        this.available = available;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublicationDate() {
        return publicationDate;
    }

    public void setPublicationDate(String publicationDate) {
        this.publicationDate = publicationDate;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public int getPages() {
        return pages;
    }

    public void setPages(int pages) {
        this.pages = pages;
    }

    public int isAvailable() {
        return available;
    }

    public void setAvailable(int available) {
        this.available = available;
    }
}
