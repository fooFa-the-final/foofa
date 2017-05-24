package fofa.store.mapper;

import java.util.List;

import fofa.domain.Report;

public interface ReportMapper {
	int insert(Report report);
	int delete(Report report);
	Report selectById(String reportId);
	List<Report> selectAll();
}
