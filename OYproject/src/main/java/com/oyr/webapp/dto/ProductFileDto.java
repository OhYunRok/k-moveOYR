package com.oyr.webapp.dto;

import java.util.Date;

public class ProductFileDto {
   private int imageId;
   private int productId;
   private String fileName;
   private long fileSize;
   private String fileContentType;
   private String fileUrl;
   private Date regDt;
  
   public int getImageId() {
	return imageId;
}

public void setImageId(int imageId) {
	this.imageId = imageId;
}

public int getProductId() {
	return productId;
}

public void setProductId(int productId) {
	this.productId = productId;
}

public String getFileName() {
	return fileName;
}

public void setFileName(String fileName) {
	this.fileName = fileName;
}

public long getFileSize() {
	return fileSize;
}

public void setFileSize(long fileSize) {
	this.fileSize = fileSize;
}

public String getFileContentType() {
	return fileContentType;
}

public void setFileContentType(String fileContentType) {
	this.fileContentType = fileContentType;
}

public String getFileUrl() {
	return fileUrl;
}

public void setFileUrl(String fileUrl) {
	this.fileUrl = fileUrl;
}

public Date getRegDt() {
	return regDt;
}

public void setRegDt(Date regDt) {
	this.regDt = regDt;
}

@Override
   public String toString() {
      return "productFile [imageId=" + imageId + ", productId=" + productId + ", fileName=" + fileName
            + ", fileSize=" + fileSize + ", fileContentType=" + fileContentType + "]";
   }
}