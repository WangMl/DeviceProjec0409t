package cn.itcast.oa.test;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ListTest {
	/**
	 * 此实验证实，list可以存放list
	 * @param args
	 */
    public static void main(String[] args) {
		List list1 = new ArrayList();
		String str1 = "wang";
		String str2 = "wang";
		String str3 = "wang";
		list1.add(str1);
		list1.add(str2);
		list1.add(str3);
		List list2 = new ArrayList();
		String str4 = "wang1";
		String str5 = "wang1";
		String str6 = "wang1";
		list1.add(str4);
		list1.add(str5);
		list1.add(str6);
		
		List list = new ArrayList();
		list.add(list1);
		list.add(list2);
		
		Iterator<List> iter = list.iterator();
		while(iter.hasNext()){
			List l = iter.next();
			Iterator<String> it = l.iterator();
			while(it.hasNext()){
				System.out.println("值 ： "+it.next());
			}
		}
	}
}
