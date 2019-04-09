package member;

import java.util.Scanner;

public class Main {

	public static void main(String[] args) {
		MemberService ms = new MemberService();
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			
		System.out.println("---회원 정보 관리---");
		System.out.println("1.회원정보입력 2.회원정보출력");
		System.out.print("선택>");
		int a= sc.nextInt();
		sc.nextLine();
		if(a==0) break;
		
		switch(a) {
			case 1 : ms.menu01(sc); break;
			case 2 : ms.menu02(sc); break;
		}
		
		}
		sc.close();
	}
}
