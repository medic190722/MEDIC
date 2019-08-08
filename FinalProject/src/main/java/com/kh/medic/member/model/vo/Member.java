package com.kh.medic.member.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class Member implements Serializable {

   /**
    * 
    */
   private static final long serialVersionUID = 1000L;
   
   private int empNo;
   private int empNo1;
   private String empPwd;
   private String empName;
   private String empAddress;
   private String empEmail;
   private String empRrn;
   private String empPhone;
   private String deptCode;
   private String jobCode;
   private int salary;
   private Date hireDate;
   private Date entDate;
   private String entYn;
   private String deptTitle;
   private String jobTitle;
   private String attend;
   private String leave;
   
   public Member() {
      super();
      // TODO Auto-generated constructor stub
   }
   
   

   



   public Member(int empNo, String empPwd, String empName, String empAddress, String empEmail, String empRrn,
         String empPhone, String deptCode, String jobCode, int salary, Date hireDate, Date entDate, String entYn) {
      super();
      this.empNo = empNo;
      this.empPwd = empPwd;
      this.empName = empName;
      this.empAddress = empAddress;
      this.empEmail = empEmail;
      this.empRrn = empRrn;
      this.empPhone = empPhone;
      this.deptCode = deptCode;
      this.jobCode = jobCode;
      this.salary = salary;
      this.hireDate = hireDate;
      this.entDate = entDate;
      this.entYn = entYn;
   }







   public Member(int empNo, int empNo1, String empPwd, String empName, String empAddress, String empEmail, String empRrn,
		String empPhone, String deptCode, String jobCode, int salary, Date hireDate, Date entDate, String entYn,
		String deptTitle, String jobTitle, String attend, String leave) {
	super();
	this.empNo = empNo;
	this.empNo1 = empNo1;
	this.empPwd = empPwd;
	this.empName = empName;
	this.empAddress = empAddress;
	this.empEmail = empEmail;
	this.empRrn = empRrn;
	this.empPhone = empPhone;
	this.deptCode = deptCode;
	this.jobCode = jobCode;
	this.salary = salary;
	this.hireDate = hireDate;
	this.entDate = entDate;
	this.entYn = entYn;
	this.deptTitle = deptTitle;
	this.jobTitle = jobTitle;
	this.attend = attend;
	this.leave = leave;
}







public Member(int empNo, String empPwd, String empName, String empAddress, String empEmail, String empRrn,
		String empPhone, String deptCode, String jobCode, int salary, Date hireDate, Date entDate, String entYn,
		String deptTitle, String jobTitle) {
	super();
	this.empNo = empNo;
	this.empPwd = empPwd;
	this.empName = empName;
	this.empAddress = empAddress;
	this.empEmail = empEmail;
	this.empRrn = empRrn;
	this.empPhone = empPhone;
	this.deptCode = deptCode;
	this.jobCode = jobCode;
	this.salary = salary;
	this.hireDate = hireDate;
	this.entDate = entDate;
	this.entYn = entYn;
	this.deptTitle = deptTitle;
	this.jobTitle = jobTitle;
}







public Member(String empPwd, String empName, String empAddress, String empEmail, String empRrn, String deptCode,
         String jobCode, int salary) {
      super();
      this.empPwd = empPwd;
      this.empName = empName;
      this.empAddress = empAddress;
      this.empEmail = empEmail;
      this.empRrn = empRrn;
      this.deptCode = deptCode;
      this.jobCode = jobCode;
      this.salary = salary;
   }

   
   public Member(String empPwd, String empName, String empAddress, String empEmail, String empRrn, String empPhone,
         String deptCode, String jobCode, int salary, Date hireDate) {
      super();
      this.empPwd = empPwd;
      this.empName = empName;
      this.empAddress = empAddress;
      this.empEmail = empEmail;
      this.empRrn = empRrn;
      this.empPhone = empPhone;
      this.deptCode = deptCode;
      this.jobCode = jobCode;
      this.salary = salary;
      this.hireDate = hireDate;
   }




   public Member(int empNo, int empNo1, String empPwd, String empName, String empAddress, String empEmail, String empRrn,
		String empPhone, String deptCode, String jobCode, int salary, Date hireDate, Date entDate, String entYn,
		String deptTitle, String jobTitle) {
	super();
	this.empNo = empNo;
	this.empNo1 = empNo1;
	this.empPwd = empPwd;
	this.empName = empName;
	this.empAddress = empAddress;
	this.empEmail = empEmail;
	this.empRrn = empRrn;
	this.empPhone = empPhone;
	this.deptCode = deptCode;
	this.jobCode = jobCode;
	this.salary = salary;
	this.hireDate = hireDate;
	this.entDate = entDate;
	this.entYn = entYn;
	this.deptTitle = deptTitle;
	this.jobTitle = jobTitle;
}







public String getAttend() {
	return attend;
}







public void setAttend(String attend) {
	this.attend = attend;
}







public String getLeave() {
	return leave;
}







public void setLeave(String leave) {
	this.leave = leave;
}







public int getEmpNo1() {
	return empNo1;
}







public void setEmpNo1(int empNo1) {
	this.empNo1 = empNo1;
}



   public String getDeptTitle() {
	return deptTitle;
}







public void setDeptTitle(String deptTitle) {
	this.deptTitle = deptTitle;
}







public String getJobTitle() {
	return jobTitle;
}







public void setJobTitle(String jobTitle) {
	this.jobTitle = jobTitle;
}







public String getEmpPhone() {
      return empPhone;
   }



   public void setEmpPhone(String empPhone) {
      this.empPhone = empPhone;
   }


   public int getEmpNo() {
      return empNo;
   }

   public void setEmpNo(int empNo) {
      this.empNo = empNo;
   }

   public String getEmpPwd() {
      return empPwd;
   }

   public void setEmpPwd(String empPwd) {
      this.empPwd = empPwd;
   }

   public String getEmpName() {
      return empName;
   }

   public void setEmpName(String empName) {
      this.empName = empName;
   }

   public String getEmpAddress() {
      return empAddress;
   }

   public void setEmpAddress(String empAddress) {
      this.empAddress = empAddress;
   }

   public String getEmpEmail() {
      return empEmail;
   }

   public void setEmpEmail(String empEmail) {
      this.empEmail = empEmail;
   }

   public String getDeptCode() {
      return deptCode;
   }

   public void setDeptCode(String deptCode) {
      this.deptCode = deptCode;
   }

   public String getJobCode() {
      return jobCode;
   }

   public void setJobCode(String jobCode) {
      this.jobCode = jobCode;
   }

   public int getSalary() {
      return salary;
   }

   public void setSalary(int salary) {
      this.salary = salary;
   }

   public Date getHireDate() {
      return hireDate;
   }

   public void setHireDate(Date hireDate) {
      this.hireDate = hireDate;
   }

   public Date getEntDate() {
      return entDate;
   }

   public void setEntDate(Date entDate) {
      this.entDate = entDate;
   }

   public String getEntYn() {
      return entYn;
   }

   public void setEntYn(String entYn) {
      this.entYn = entYn;
   }

   public String getEmpRrn() {
      return empRrn;
   }



   public void setEmpRrn(String empRrn) {
      this.empRrn = empRrn;
   }



   @Override
public String toString() {
	return "Member [empNo=" + empNo + ", empNo1=" + empNo1 + ", empPwd=" + empPwd + ", empName=" + empName
			+ ", empAddress=" + empAddress + ", empEmail=" + empEmail + ", empRrn=" + empRrn + ", empPhone=" + empPhone
			+ ", deptCode=" + deptCode + ", jobCode=" + jobCode + ", salary=" + salary + ", hireDate=" + hireDate
			+ ", entDate=" + entDate + ", entYn=" + entYn + ", deptTitle=" + deptTitle + ", jobTitle=" + jobTitle
			+ ", attend=" + attend + ", leave=" + leave + "]";
}
   
   

}