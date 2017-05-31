package fofa.scheduler;

import java.util.Date;
import java.util.List;

import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.context.ApplicationContext;
import org.springframework.scheduling.quartz.QuartzJobBean;

import fofa.domain.Advertise;
import fofa.service.AdvertiseService;


public class ApproveAdJobBean extends QuartzJobBean{
	
	private ApplicationContext context;
	private AdvertiseService service;
	
	@Override
	protected void executeInternal(JobExecutionContext arg0) throws JobExecutionException {
		context = (ApplicationContext)arg0.getJobDetail().getJobDataMap().get("applicationContext");
		service = (AdvertiseService)context.getBean("advertiseServiceLogic");
		
		List<Advertise> list = service.findExpired();
		
		for(Advertise ad : list){
			ad.setAdvId(ad.getAdvId());
			ad.setApprove(2);
			service.modify(ad);
		}
		
	}
	
	
}
