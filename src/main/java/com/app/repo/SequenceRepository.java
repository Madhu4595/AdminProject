package com.app.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.app.entity.SequenceEntity;

@Repository
public interface SequenceRepository extends JpaRepository<SequenceEntity, Long> {
    // Add any custom query methods if needed
}
