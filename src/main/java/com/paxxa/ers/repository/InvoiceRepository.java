package com.paxxa.ers.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.paxxa.ers.entity.Invoice;

public interface InvoiceRepository extends JpaRepository<Invoice, Integer> {

}
