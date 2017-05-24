package fofa.store.mapper;

import java.util.List;

import fofa.domain.Report;

public interface ReportMapper {
	void insert(Report report);
	void delete(String reportId);
	Report selectById(String reportId);
	List<Report> selectAll();
}
