/* 
 * ���α׷���: ��������
 * �ۼ��� : �̹���
 * �ۼ��� : 20190218
 * 
 */

public class Program {

	public static void main(String[] args) {
		

		//----------------------
		//�Է� �ܰ�
		//���� �����
		//���� ������ ������ ������
		//���� ����(����1, ����2, ����3) �Է�
		int kor, eng, math;
		int total;
		float avg;
		kor = 60;
		eng = 70;
		math = 80;
		total = 0;
		avg = 0;
		

		//----------------------
		//ó���ܰ�
		//���� ����(����, ���) ���
		total = kor + eng + math;
		avg = total / 3;
		
		
		//----------------------
		//��� �ܰ�
		//���� ����(����, ���) ���
		System.out.printf("����:%d, ���:%f", total, avg);

	}

}
