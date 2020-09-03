package cn.lanpangtou.pojo;

import cn.lanpangtou.util.DateUtils;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class User {
    private Integer id;//用户id
    private String name;//用户名称
    private String password;//用户密码
    private String images;//头像
    private Boolean admin;//是否是管理员
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date birthday;//用户生日
    private String birthdayStr;//用户生日
    private Boolean sex;//用户性别
    private String phone;//用户电话
    private String email;//用户邮箱
    private String address;//用户住址
    private Date createTime;//创建时间

    public String getBirthdayStr() {
        if(birthday != null){
            birthdayStr = DateUtils.dateToString(birthday,"yyyy-MM-dd HH:mm:ss");
        }
        return birthdayStr;
    }

    public String getImages() {
        return images;
    }

    public void setImages(String images) {
        this.images = images;
    }

    public void setBirthdayStr(String birthdayStr) {
        this.birthdayStr = birthdayStr;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getAdmin() {
        return admin;
    }

    public void setAdmin(Boolean admin) {
        admin = admin;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Date getBirthday() {

        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public Boolean getSex() {
        return sex;
    }

    public void setSex(Boolean sex) {
        this.sex = sex;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", images='" + images + '\'' +
                ", admin=" + admin +
                ", birthday=" + birthday +
                ", birthdayStr='" + birthdayStr + '\'' +
                ", sex=" + sex +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", address='" + address + '\'' +
                ", createTime=" + createTime +
                '}';
    }
}
