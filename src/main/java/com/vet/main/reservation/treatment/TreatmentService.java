package com.vet.main.reservation.treatment;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;

import com.vet.main.customer.CustomerVO;
import com.vet.main.dept.DeptVO;
import com.vet.main.emp.EmpVO;

import lombok.extern.slf4j.Slf4j;
import net.nurigo.sdk.NurigoApp;
import net.nurigo.sdk.message.exception.NurigoMessageNotReceivedException;
import net.nurigo.sdk.message.model.Message;
import net.nurigo.sdk.message.service.DefaultMessageService;

@Service
@Slf4j
public class TreatmentService {

	@Autowired
	private TreatmentDAO treatmentDAO;

	@Value("${coolsms.apikey}")
	private String apiKey;
	@Value("${coolsms.apisecret}")
	private String apiSecret;
	@Value("${coolsms.fromnumber}")
	private String fromNumber;

	// 예약문자
	@Scheduled(cron = "0 0 8 * * 1-6")
	public void sendMessage() {
		LocalDate date1 = LocalDate.now();
		List<TreatmentVO> list = treatmentDAO.getTreatment();

		for (int i = 0; i < list.size(); i++) {

			LocalDateTime date2 = list.get(i).getTreatmentDate();
			System.out.println(date2.toLocalDate());

			if (date1.isEqual(date2.toLocalDate())) {
				String phoneNum = list.get(i).getPhone();
				String name = list.get(i).getAnimalName();

				DefaultMessageService messageService = NurigoApp.INSTANCE.initialize(apiKey, apiSecret,
						"https://api.coolsms.co.kr");

				Message message = new Message();
				message.setFrom(fromNumber);
				message.setTo(phoneNum);
				message.setText(name + "보호자님 진료예약 당일입니다!");

				try {
					messageService.send(message);
				} catch (NurigoMessageNotReceivedException exception) {
					System.out.println(exception.getFailedMessageList());
					System.out.println(exception.getMessage());
				} catch (Exception exception) {
					System.out.println(exception.getMessage());
				}
			}
		}
	}

	public List<TreatmentVO> getScheduleList(String deptNo) throws Exception {
		if (deptNo.equals("300")) {
			return treatmentDAO.getScheduleList();
		} else {
			return treatmentDAO.getDeptScheduleList(deptNo);
		}
	};

	
	  public List<TreatmentVO> getDeptScheduleList(String deptNo) throws Exception{
	  
	  if(deptNo.equals("300")) {
		  return treatmentDAO.getScheduleList(); 
	  }else { 
		  return treatmentDAO.getDeptScheduleList(deptNo); 
	  } };


	public int setTreatmentAdd(TreatmentVO treatmentVO) throws Exception {

		return treatmentDAO.setTreatmentAdd(treatmentVO);
	}

	public List<CustomerVO> getCustomerList(String animalName) throws Exception {
		return treatmentDAO.getCustomerList(animalName);
	}

	public List<EmpVO> getEmpList(String deptNo) throws Exception {

		if (deptNo.equals("300")) {
			return treatmentDAO.getAllEmpList();
		} else {
			return treatmentDAO.getEmpList(deptNo);
		}
	}

	public List<DeptVO> getDeptList() throws Exception {
		return treatmentDAO.getDeptList();
	}

	public TreatmentVO getDetail(TreatmentVO treatmentVO) throws Exception {
		return treatmentDAO.getDetail(treatmentVO);
	}

	public int setDelete(TreatmentVO treatmentVO) throws Exception {
		return treatmentDAO.setDelete(treatmentVO);
	}

	public int setUpdate(TreatmentVO treatmentVO) throws Exception {
		return treatmentDAO.setUpdate(treatmentVO);
	}

	public int reservedTreat(TreatmentVO treatmentVO) throws Exception {
		return treatmentDAO.reservedTreat(treatmentVO);
	}
	
	public List<TreatmentVO> getPersonSchedule(String username)throws Exception{
		return treatmentDAO.getPersonSchedule(username);		
	}

}
