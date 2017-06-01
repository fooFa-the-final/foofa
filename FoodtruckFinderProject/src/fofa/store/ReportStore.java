package fofa.store;

import java.util.List;

import fofa.domain.Report;

public interface ReportStore {
	int insert(Report report);
	int delete(Report report);
	List<Report> selectById(String reviewId);
	List<Report> selectAll();
}
