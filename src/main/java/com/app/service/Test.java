package com.app.service;

import java.io.IOException;

import com.itextpdf.kernel.font.PdfFont;
import com.itextpdf.kernel.font.PdfFontFactory;
import com.itextpdf.kernel.pdf.PdfDocument;
import com.itextpdf.kernel.pdf.PdfWriter;
import com.itextpdf.layout.Document;
import com.itextpdf.layout.element.Paragraph;

public class Test {

	public static final  String hindifont="C:\\Users\\swamy\\Desktop\\APBOCWWB\\Krishna-MxYY.ttf";
	public static void main(String[] args) throws IOException {
		String filePath="C:\\Users\\swamy\\Desktop\\APBOCWWB\\hinditext.pdf";
		PdfWriter pdfWriter=new PdfWriter(filePath);
		PdfDocument pdfDocument=new PdfDocument(pdfWriter);
		pdfDocument.addNewPage();
		
		Document document=new Document(pdfDocument);
		
		PdfFont hindiFont=PdfFontFactory.createFont(hindifont, true);
		Paragraph p=new Paragraph();
		p.add(",uvkbZlh] fot;okM+k] vka/kz çns'k").setFont(hindiFont);
		
		document.add(p);
		
		Paragraph p2=new Paragraph("asdfasdfasdfasdfasdfasdfasdfasdf");
		document.add(p2);
		
		document.close();
		System.out.println("pdf created...");
	}
	
}
