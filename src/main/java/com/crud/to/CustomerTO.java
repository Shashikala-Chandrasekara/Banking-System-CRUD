package com.crud.to;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Null;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerTO implements Serializable {

    @NotBlank(message = "nic can't be empty")
    private String nic;
    @NotBlank(message = "Name can't be empty")
    private String name;
    @NotBlank(message = "Address can't be empty")
    private String address;
    @NotBlank(message = "Mobile Number can't be empty")
    private String mobileNumber;


}
