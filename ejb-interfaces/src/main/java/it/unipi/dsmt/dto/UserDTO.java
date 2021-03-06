package it.unipi.dsmt.dto;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class UserDTO implements Serializable {

    private String user_id;
    public String name;
    public String surname;
    public String username;
    public String email;
    public String city;
    public String postal_code;
    public String description;
    public ArrayList<String> pets;
    public String password;
    public boolean petsitter;
    public boolean male;

    public UserDTO(String user_id, String name, String surname, String username, String email, String city, String postal_code, String description, ArrayList<String> pets, String password, boolean petsitter, boolean male) {
        this.user_id = user_id;
        this.name = name;
        this.surname = surname;
        this.username = username;
        this.email = email;
        this.city = city;
        this.postal_code = postal_code;
        this.description = description;
        this.pets = pets;
        this.password = password;
        this.petsitter = petsitter;
        this.male = male;
    }

    public void setUser_id(String user_id) {
        this.user_id = user_id;
    }

    public String getUser_id() {
        return user_id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isPetsitter() {
        return petsitter;
    }

    public void setPetsitter(boolean petsitter) {
        this.petsitter = petsitter;
    }

    public boolean isMale() {
        return male;
    }

    public void setMale(boolean male) {
        this.male = male;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getPostal_code() {
        return postal_code;
    }

    public void setPostal_code(String postal_code) {
        this.postal_code = postal_code;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public ArrayList<String> getPets() {
        return pets;
    }

    public void setPets(ArrayList pets) {
        this.pets = pets;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Override
    public String toString() {
        return "UserDTO{" +
                "user_id='" + user_id + '\'' +
                ", name='" + name + '\'' +
                ", surname='" + surname + '\'' +
                ", username='" + username + '\'' +
                ", email='" + email + '\'' +
                ", city='" + city + '\'' +
                ", postal_code='" + postal_code + '\'' +
                ", description='" + description + '\'' +
                ", pets=" + pets +
                ", password='" + password + '\'' +
                ", petsitter=" + petsitter +
                ", male=" + male +
                '}';
    }

}
