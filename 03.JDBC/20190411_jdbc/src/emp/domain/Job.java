package emp.domain;

// 직원 관련 클래스
public class Job {
	private String jobId, job_title;
	private int basicpay;
	
	public Job() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Job(String jobId, String job_title) {
		super();
		this.jobId = jobId;
		this.job_title = job_title;
	}
	
	public Job(String jobId, String job_title, int basicpay) {
			super();
			this.jobId = jobId;
			this.job_title = job_title;
			this.basicpay = basicpay;
	}
	
	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
		this.jobId = jobId;
	}

	public String getJob_title() {
		return job_title;
	}

	public void setJob_title(String job_title) {
		this.job_title = job_title;
	}
	
	public int getBasicpay() {
		return basicpay;
	}

	public void setBasicpay(int basicpay) {
		this.basicpay = basicpay;
	}

}
