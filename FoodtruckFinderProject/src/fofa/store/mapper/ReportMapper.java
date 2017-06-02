package fofa.store.mapper;

import java.util.List;

import fofa.domain.Report;

public interface ReportMapper {
	int insert(Report report);
	int delete(String reviewId);
	List<Report> selectById(String reviewId);
	List<Report> selectAll();
}
