package kjh_JSP;

public class Util {

	public static String method(int a) {
		String two = "";

		while (true) {
			two = String.valueOf(a % 2)+ two;
			a = a - ((a / 2) + (a % 2));
			if (a == 0)
				break;
		}

		return two;
	}
}
