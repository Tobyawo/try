package com.example.demo8.Model;

import javax.servlet.annotation.WebServlet;


public class User {
    protected String first_name;
    protected String surname;
    protected String phone_number;
    protected String email;
    protected int day_of_birth;
    protected String month_of_birth;
    protected int year_of_birth;
    protected String gender;
    protected String password;


    public User() {
    }

    public User(String first_name,String surname, String phone_number,String email,int day_of_birth,String month_of_birth,int year_of_birth, String gender) {
        // super();
        this.first_name = first_name;
        this.surname = surname;
        this.phone_number = phone_number;
        this.email = email;
        this.day_of_birth = day_of_birth;
        this.month_of_birth = month_of_birth;
        this.year_of_birth = year_of_birth;
        this.gender = gender;

    }

    public User(String first_name, String surname, String phone_number, String email) {
        this.first_name=first_name;
        this.surname =surname;
        this.phone_number=phone_number;
        this.email=email;
    }

    public User(String email, String password){
        this.email = email;
        this.password=password;
    }



    public String getFirst_name() {
        return first_name;
    }

    public String getSurname() {
        return surname;
    }

    public String getPhone_number() {
        return phone_number;
    }

    public String getEmail() {
        return email;
    }

    public int getDay_of_birth() {
        return day_of_birth;
    }

    public String getMonth_of_birth() {
        return month_of_birth;
    }

    public int getYear_of_birth() {
        return year_of_birth;
    }

    public String getGender() {
        return gender;
    }


    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setDay_of_birth(int day_of_birth) {
        this.day_of_birth = day_of_birth;
    }

    public void setMonth_of_birth(String month_of_birth) {
        this.month_of_birth = month_of_birth;
    }

    public void setYear_of_birth(int year_of_birth) {
        this.year_of_birth = year_of_birth;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getPassword() {
        return password;
    }
}
