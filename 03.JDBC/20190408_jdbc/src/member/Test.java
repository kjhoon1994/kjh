package member;

import java.util.List;

public class Test {
	public static void main(String[] args) {

		MemberDAO mdao = new MemberDAO();
		
		List<Member> list=mdao.list();
		
		for (Member m : list)
		{
			System.out.printf("%s / %s / %s / %s%n"
					, m.getMid()
					, m.getName_()
					, m.getPhone()
					, m.getEmail());
		}
		System.out.printf("총 %d명%n", list.size());
	}
}
