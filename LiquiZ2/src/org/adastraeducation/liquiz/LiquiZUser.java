package org.adastraeducation.liquiz;

public class LiquiZUser extends User {

	public LiquiZUser(String id, String passwd, String fName, String lName,
			String email) {
		super(id, passwd, fName, lName, email);
		// TODO Auto-generated constructor stub
	}
	public static final int CREATE = 4; // include edit and delete maybe?
	public static final int EDIT = 8; // only
	public static final int DELETE = 16; // delete only??? it seems unnecessary
	public static final int COPY = 32;
	public static final int GRADE = 64;
	public static final int READ = 128;
	//...
}