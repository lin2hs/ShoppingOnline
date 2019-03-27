/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.linhtd.entity;

import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Linh
 */
public class FileModel {
    
    private MultipartFile file;

    public FileModel() {
    }
    
    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }
    
}
