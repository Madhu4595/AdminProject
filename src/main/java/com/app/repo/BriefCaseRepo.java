package com.app.repo;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.app.entity.BriefCase;

public interface BriefCaseRepo extends JpaRepository<BriefCase, String>{
	
	public List<BriefCase> findByNoteStatus(Boolean noteStatus);
	public List<BriefCase> findBySanctionStatus(Boolean sanctionStatus);
	public BriefCase findBySanctionNumber(String sanctionNumber);
	
	
	@Query(value="select * from briefcase where note_status=:noteStatus and sanction_status=:sanctionStatus",nativeQuery = true)
	public List<BriefCase> findByNoteStatusandSanctionStatus(Boolean noteStatus,Boolean sanctionStatus);
	

}
