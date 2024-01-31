package com.app.util;

import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Service;

import com.itextpdf.text.pdf.BaseFont;
import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;
@Service
public class PDFGenerator {

	  public void generatePdf(String hindiText, String outputPath) throws DocumentException, IOException {
	        Document document = new Document();
	        PdfWriter.getInstance(document, new FileOutputStream(outputPath));

	        // Use a font that supports Hindi characters
	        Font font = FontFactory.getFont("Arial Unicode MS", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);

	        document.open();

	        // Add a paragraph with the Hindi text
	        Paragraph paragraph = new Paragraph(hindiText, font);
	        document.add(paragraph);

	        document.close();
	    }
}
