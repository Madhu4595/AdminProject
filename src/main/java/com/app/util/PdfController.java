package com.app.util;

import net.sf.jasperreports.engine.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.ByteArrayInputStream;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/generate-pdf")
public class PdfController {

//    @Autowired
//    private JasperReport hindiReport;
//
//    @GetMapping
//    public ResponseEntity<InputStreamResource> generatePdf() throws JRException {
//        // Hindi text to be displayed in the report
//        String hindiText = "आपका हिंदी टेक्स्ट यहाँ है।";
//        hindiText = hindiText+"adfasdfasdf";
//
//        // Compile the Jasper Report
//        JasperPrint jasperPrint = generatePdfReport(hindiText);
//
//        // Set the headers for the response
//        HttpHeaders headers = new HttpHeaders();
//        headers.setContentType(MediaType.APPLICATION_PDF);
//        headers.setContentDispositionFormData("attachment", "hindiReport.pdf");
//
//        // Convert JasperPrint to InputStream
//        byte[] pdfBytes = JasperExportManager.exportReportToPdf(jasperPrint);
//        InputStreamResource inputStreamResource = new InputStreamResource(new ByteArrayInputStream(pdfBytes));
//
//        // Return the ResponseEntity
//        return ResponseEntity.ok()
//                .headers(headers)
//                .body(inputStreamResource);
//    }
//
//    private JasperPrint generatePdfReport(String hindiText) throws JRException {
//        // Set parameters for the Jasper Report
//        Map<String, Object> parameters = new HashMap<>();
//        parameters.put("financialYear", hindiText);
//        parameters.put("distanceHostel", "ddddddddddddddddddddddddddddddd");
//
//        // Generate the JasperPrint
//        return JasperFillManager.fillReport(hindiReport, parameters, new JREmptyDataSource());
//    }
}

