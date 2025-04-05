package com.model;

import java.util.List;

public class AjaxResponse {
private String result;
private List<String> list;
public String getResult() {
	return result;
}
public void setResult(String result) {
	this.result = result;
}
public List<String> getList() {
	return list;
}
public void setList(List<String> list) {
	this.list = list;
}
@Override
public String toString() {
	return "AjaxResponse [result=" + result + ", list=" + list + "]";
}
public AjaxResponse(String result, List<String> list) {
	this.result = result;
	this.list = list;
}

}
