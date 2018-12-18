package com.great.bean;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Page {
	public static int NUMBER=5;
	private Integer count;
	private Integer all;
	private Integer page;
	private List<?> list ;
	private Integer next;
	private Integer up;
	private List li = new ArrayList<>();
	
	public Page(Integer count, Integer page, List<?> list) {
		this.count = count;
		this.page = page;
		this.list = list;
		all =  count / NUMBER + (count % NUMBER == 0 ? 0 : 1);
		next = page+1>=all?all:page+1;
		up = page-1<=1?1:page-1;
		Integer a = 0;
		if(all-page>=5){
			a=5;
		}else {
			a= all-page;
		}
		for(int i= 1;i<=a;i++){
			li.add(page+i);
		}
		
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getCount() {
		return count;
	}
	public void setCount(Integer count) {
		this.count = count;
	}
	public Integer getAll() {
		return all;
	}
	public void setAll(Integer all) {
		this.all = all;
	}
	public List<?> getList() {
		return list;
	}
	public void setList(List<?> list) {
		this.list = list;
	}
	public Integer getNext() {
		return next;
	}
	public void setNext(Integer next) {
		this.next = next;
	}
	public Integer getUp() {
		return up;
	}
	public void setUp(Integer up) {
		this.up = up;
	}
	public List getLi() {
		return li;
	}
	public void setLi(List li) {
		this.li = li;
	}
	
}
