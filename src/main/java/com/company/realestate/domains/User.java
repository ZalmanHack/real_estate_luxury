package com.company.realestate.domains;

import com.company.realestate.domains.enums.Role;
import com.company.realestate.domains.posts.Post;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;
import lombok.ToString;
import org.hibernate.validator.constraints.Length;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Set;

@ToString(includeFieldNames=true)
@Data
@Entity
@Table(name = "_user")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class User implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    @ElementCollection(targetClass = Role.class, fetch = FetchType.EAGER)
    @CollectionTable(name = "userRole", joinColumns = @JoinColumn(name = "userId"))
    @Enumerated(EnumType.STRING)
    private Set<Role> roles;

    @Email(message = "Введите корректный почтовый адрес")
    @Length(min = 5, max = 320)
    @NotBlank
    private String email;

    @Length(max = 320)
    private String newEmail;

    @Length(min = 1, max = 64)
    @NotBlank
    private String username;

    @Length(min = 1, max = 64)
    @NotBlank
    private String companyName;

    @Length(min = 1, max = 26)
    @NotBlank
    private String firstName;

    @Length(min = 1, max = 26)
    @NotBlank
    private String lastName;

    private Long phone;

    @JsonIgnore
    @OneToMany(mappedBy = "author", fetch = FetchType.EAGER)
    private List<Post> posts = new ArrayList<>();

    private String password = "";

    private Boolean active;

    private String profileImage;

    private String activationCode;

    private String restorePasswordCode;

    public boolean isAdmin() {
        return roles.contains(Role.ADMIN);
    }

    public boolean isUser() {
        return roles.contains(Role.USER);
    }

    public boolean isPremium() {
        return roles.contains(Role.PREMIUM);
    }

    public String getInitials() {
        if(lastName.isEmpty() || firstName.isEmpty()) {
            return "";
        }
        return (Character.toString(lastName.charAt(0)) + firstName.charAt(0)).toUpperCase();
    }

    public boolean hasPost(long postId) {
        return this.getPosts().stream().anyMatch(post -> post.getId() == postId);
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return getRoles();
    }

    @Override
    public String getPassword() {
        return this.password;
    }

    @Override
    public String getUsername() {
        return this.username;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return getActive();
    }
}
