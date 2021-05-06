package com.example.demo8.Model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class Comment {


    private String sessionId;
    private String email;
    private Date creationTime;
    private String comment;
    private Date lastAccessedTime;
    private int LikesOrDislikes;
    public List<String> Comment = new ArrayList<String>();



    public Comment(String email, String comment, String sessionId, Date creationTime, Date lastAccessedTime) {

        this.email = email;
        this.sessionId = sessionId;
        this.creationTime = creationTime;
        this.comment = comment;
        this.lastAccessedTime = lastAccessedTime;
    }

    public Comment(String email, String comment, String sessionId, Date creationTime, Date lastAccessedTime, int LikesOrDislikes) {
        this.sessionId = sessionId;
        this.email = email;
        this.creationTime = creationTime;
        this.comment = comment;
        this.lastAccessedTime = lastAccessedTime;
        this.LikesOrDislikes = LikesOrDislikes;
    }
    public Comment(){}
    public String getSessionId() {
        return sessionId;
    }

    public String getEmail() {
        return email;
    }

    public Date getCreationTime() {
        return creationTime;
    }

    public String getComment() {
        return comment;
    }

    public Date getLastAccessedTime() {
        return lastAccessedTime;
    }
}