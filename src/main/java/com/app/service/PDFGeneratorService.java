package com.app.service;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;

import com.lowagie.text.Document;
import com.lowagie.text.Font;
import com.lowagie.text.FontFactory;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;

@Service
@Component
public class PDFGeneratorService {

	public void export(HttpServletResponse response) throws IOException {
		Document document = new Document();
		PdfWriter.getInstance(document, response.getOutputStream());
		
		document.open();
		Font fontTitle = FontFactory.getFont(FontFactory.HELVETICA_BOLD);
		fontTitle.setSize(18);
		
		Paragraph paragraph = new Paragraph("This is a title",fontTitle);
		paragraph.setAlignment(Paragraph.ALIGN_CENTER);
		
		Font fontParagraph = FontFactory.getFont(FontFactory.HELVETICA);
		fontParagraph.setSize(12);
		
		Paragraph paragraph2 = new Paragraph("THis is a paragraph", fontParagraph);
		paragraph2.setAlignment(Paragraph.ALIGN_LEFT);
		
		document.add(paragraph);
		document.add(paragraph2);
		document.close();
	}
}
