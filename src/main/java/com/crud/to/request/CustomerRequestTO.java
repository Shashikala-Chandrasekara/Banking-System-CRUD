package com.crud.to.request;

import jakarta.validation.constraints.NotBlank;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CustomerRequestTO implements Serializable {

    @NotBlank(message = "nic can't be empty")
    private String nic;
    @NotBlank(message = "Name can't be empty")
    private String name;
    @NotBlank(message = "Address can't be empty")
    private String address;
    @NotBlank(message = "Mobile Number can't be empty")
    private String mobileNumber;

}
