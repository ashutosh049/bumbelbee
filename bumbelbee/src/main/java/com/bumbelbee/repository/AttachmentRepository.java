package com.bumbelbee.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.bumbelbee.model.Attachment;

@Repository
public interface AttachmentRepository extends JpaRepository<Attachment, Long>{

}
