package fofa.store;

import java.util.List;

import fofa.domain.Report;

public interface ReportStore {
	int insert(Report report);
	int delete(Report report);
	Report selectById(Report report);
	List<Report> selectAll();
}
