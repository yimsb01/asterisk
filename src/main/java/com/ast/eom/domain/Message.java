package com.ast.eom.domain;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Message {
  private int messageNo;
  private int senderNo;
  private int receiverNo;
  private String messageContents;
  @JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
  private Date sendDate;
  private boolean read;
  
  @Override
  public String toString() {
    return "Message [messageNo=" + messageNo + ", senderNo=" + senderNo + ", receiverNo=" + receiverNo
        + ", messageContents=" + messageContents + ", sendDate=" + sendDate + ", read=" + read + "]";
  }
  public int getMessageNo() {
    return messageNo;
  }
  public void setMessageNo(int messageNo) {
    this.messageNo = messageNo;
  }
  public int getSenderNo() {
    return senderNo;
  }
  public void setSenderNo(int senderNo) {
    this.senderNo = senderNo;
  }
  public int getReceiverNo() {
    return receiverNo;
  }
  public void setReceiverNo(int receiverNo) {
    this.receiverNo = receiverNo;
  }
  public String getMessageContents() {
    return messageContents;
  }
  public void setMessageContents(String messageContents) {
    this.messageContents = messageContents;
  }
  public Date getSendDate() {
    return sendDate;
  }
  public void setSendDate(Date sendDate) {
    this.sendDate = sendDate;
  }
  public boolean isRead() {
    return read;
  }
  public void setRead(boolean read) {
    this.read = read;
  }
  
}
