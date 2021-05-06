package com.example.demo8.Model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Post {


    private String sessionId;
    private String email;
    private Date creationTime;
    private String post;
    private Date lastAccessedTime;
    private int LikesOrDislikes;
    public List<String> Posts = new ArrayList<String>();



    public Post(String email, String post, String sessionId, Date creationTime, Date lastAccessedTime) {
        this.email = email;
        this.post = post;
        this.sessionId = sessionId;
        this.creationTime = creationTime;
        this.lastAccessedTime = lastAccessedTime;
    }

    public Post(String email, String post, String sessionId, Date creationTime, Date lastAccessedTime, int LikesOrDislikes) {
        this.sessionId = sessionId;
        this.email = email;
        this.creationTime = creationTime;
        this.post = post;
        this.lastAccessedTime = lastAccessedTime;
        this.LikesOrDislikes = LikesOrDislikes;
    }
public Post(){}
    public String getSessionId() {
        return sessionId;
    }

    public String getEmail() {
        return email;
    }

    public Date getCreationTime() {
        return creationTime;
    }

    public String getPost() {
        return post;
    }

    public Date getLastAccessedTime() {
        return lastAccessedTime;
    }
}