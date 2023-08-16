package com.app.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.entity.SequenceEntity;
import com.app.repo.SequenceRepository;

@Service
public class SequenceService {
    private final SequenceRepository sequenceRepository;

    @Autowired
    public SequenceService(SequenceRepository sequenceRepository) {
        this.sequenceRepository = sequenceRepository;
    }

    public Long getNextValueFromSequence() {
        SequenceEntity sequence = new SequenceEntity();
        sequenceRepository.save(sequence); // Persist the sequence entity to generate the next value
        return sequence.getId();
    }
}