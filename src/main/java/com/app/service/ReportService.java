package com.app.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import net.sf.jasperreports.engine.JREmptyDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

@Service
public class ReportService {

    public byte[] generatePdf() throws JRException, IOException {
        // Load the JRXML file
        String jrxmlPath = "C:\\Users\\swamy\\Desktop\\AdminProject-WS\\AdminProject\\src\\main\\resources\\report.jrxml";
        JasperReport jasperReport = JasperCompileManager.compileReport(jrxmlPath);

        // Set parameters
        Map<String, Object> parameters = new HashMap<>();
//        parameters.put("hindiText", hindiText);

        // Generate the report
        JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, parameters, new JREmptyDataSource());

        // Export to PDF
        byte[] pdfBytes = JasperExportManager.exportReportToPdf(jasperPrint);

        return pdfBytes;
    }
}

