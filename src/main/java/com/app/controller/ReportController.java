package com.app.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.app.service.ReportService;

import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperCompileManager;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperPrint;

@RestController
public class ReportController {

    @Autowired
    private ReportService reportService;

    @GetMapping(value = "/generate", produces = MediaType.APPLICATION_PDF_VALUE)
    public byte[] generateReport() {
        try {
            return reportService.generatePdf();
        } catch (JRException | IOException e) {
            e.printStackTrace();
            return null; // Handle the error appropriately
        }
    }
    
    
    
    @GetMapping("/download-pdf")
    public ResponseEntity<InputStreamResource> downloadPdf() throws JRException, IOException {

        // Convert the JasperPrint to a byte array (PDF format)
        byte[] pdfBytes = reportService.generatePdf();

        // Create an InputStreamResource to stream the PDF
        InputStreamResource inputStreamResource = new InputStreamResource(new ByteArrayInputStream(pdfBytes));

        // Set response headers
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_PDF);
        headers.setContentDispositionFormData("attachment", "exampleReport.pdf");

        // Return the ResponseEntity with the InputStreamResource
        return ResponseEntity
                .ok()
                .headers(headers)
                .body(inputStreamResource);
    }
}
