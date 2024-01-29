package com.crud.to.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Pattern;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.hibernate.validator.constraints.Length;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerRequestTO implements Serializable {

    @NotBlank(message = "nic can't be empty")
    @Pattern(regexp = "^[1-9][0-9]{8}[Vv]$", message = "Invalid NIC")
    private String nic;
    @NotBlank(message = "Name can't be empty")
    @Pattern(regexp = "^[A-Za-z ]+$", message = "Invalid name")
    private String name;
    @NotBlank(message = "Address can't be empty")
    @Length(min = 3)
    private String address;
    @NotBlank(message = "Mobile Number can't be empty")
    @Pattern(regexp = "^0[0-9]{9}$")
    private String mobileNumber;

}
