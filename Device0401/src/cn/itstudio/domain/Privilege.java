package cn.itstudio.domain;

import java.util.HashSet;
import java.util.Set;

/**
 * 权限
 * 
 * @author tyg
 * 
 */
@SuppressWarnings("serial")
public class Privilege implements java.io.Serializable {
	private Long id;
	private String url;
	private String name; // 权限名称
	private String imgClass; //存储菜单图片相关的类
	private Set<Role> roles = new HashSet<Role>();
	private Privilege parent; // 上级权限
	private Set<Privilege> children = new HashSet<Privilege>(); // 下级权限

	public Privilege() {
	}

	public Privilege(String name, String url,String imgClass, Privilege parent) {
		this.name = name;
		this.url = url;
		this.imgClass = imgClass;
		this.parent = parent;
		
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public Privilege getParent() {
		return parent;
	}

	public void setParent(Privilege parent) {
		this.parent = parent;
	}

	public Set<Privilege> getChildren() {
		return children;
	}

	public void setChildren(Set<Privilege> children) {
		this.children = children;
	}

	public String getImgClass() {
		return imgClass;
	}

	public void setImgClass(String imgClass) {
		this.imgClass = imgClass;
	}
    
}
