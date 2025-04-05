package com.model;
public class ChartIfroDto {
	
public ChartIfroDto(String from, String to, String message, String date) {
		
		this.from = from;
		this.to = to;
		this.message = message;
		this.Date = date;
	}
private String from;
@Override
public String toString() {
	return "ChartIfroDto [from=" + from + ", to=" + to + ", message=" + message + ", Date=" + Date + "]";
}
public String getFrom() {
	return from;
}
public void setFrom(String from) {
	this.from = from;
}
public String getTo() {
	return to;
}
public void setTo(String to) {
	this.to = to;
}
public String getMessage() {
	return message;
}
public void setMessage(String message) {
	this.message = message;
}
public String getDate() {
	return Date;
}
public void setDate(String date) {
	Date = date;
}
private String to;
private String message;
private String Date;
}
