package cn.itcast.oa.test;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import cn.itstudio.domain.User;

public class RandomListTest {
     public static void main(String[] args) {
		List<User> userList = new ArrayList<User>();
	    User user1 =new User();
	    user1.setName("张三");
	    User user2 =new User();
	    user2.setName("李四");
	    User user3 =new User();
	    user3.setName("王五");
	    userList.add(user1);
	    userList.add(user2);
	    userList.add(user3);
	    Random r = new Random();
	    int i = r.nextInt(userList.size());
	   
	    System.out.println("第"+i+"个元素"+userList.get(i).getName()+userList.size());
	}
}
