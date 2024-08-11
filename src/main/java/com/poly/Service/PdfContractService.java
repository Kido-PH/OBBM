package com.poly.Service;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import org.springframework.stereotype.Service;

import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.BaseFont;
import com.itextpdf.text.pdf.PdfWriter;
import com.poly.Entities.Contract;

@Service
public class PdfContractService {
	private static final String FONT = "src/main/resources/static/assets/font/dejavu-sans/DejaVuSans.ttf";
	
	public ByteArrayInputStream generateContractPDF(Contract contract) throws DocumentException, IOException {
        Document document = new Document();
        ByteArrayOutputStream out = new ByteArrayOutputStream();

        try {
            PdfWriter.getInstance(document, out);
            document.open();

            BaseFont bf = BaseFont.createFont(FONT, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            Font titleFont = new Font(bf, 18, Font.BOLD);
            Font textFont = new Font(bf, 12);

            // Title
            Paragraph title = new Paragraph("HỢP ĐỒNG DỊCH VỤ", titleFont);
            title.setAlignment(Element.ALIGN_CENTER);
            document.add(title);

            // Empty line
            document.add(new Paragraph(" "));
            
            
            // Contract details
            addTextToDocument(document, "Bên A (Công ty): ", "OBBM - Online Banquet Booking Management", textFont);
            document.add(new Paragraph(" "));

            addTextToDocument(document, "Mã hợp đồng: ", contract.getMahopdong(), textFont);
            addTextToDocument(document, "Đại diện: ", contract.getNguoixuly(), textFont);
            addTextToDocument(document, "Ngày ký: ", formatDate(contract.getNgaylap()), textFont);
            addTextToDocument(document, "Địa điểm tổ chức: ", contract.getDiadiemid().getTendiadiem(), textFont);
            document.add(new Paragraph(" "));
            
            addTextToDocument(document, "Bên B (khách hàng): ", contract.getMakhachhang().getTenkhachhang(), textFont);
            addTextToDocument(document, "CCCD: ", contract.getMakhachhang().getCccd(), textFont);
            addTextToDocument(document, "Số Điện Thoại: ", contract.getMakhachhang().getSodienthoai(), textFont);
            addTextToDocument(document, "Địa Chỉ: ", contract.getMakhachhang().getDiachi(), textFont);
            document.add(new Paragraph(" "));


            addTextToDocument(document, "Ngày tổ chức: ", formatDate(contract.getNgaytochuc()), textFont);
            addTextToDocument(document, "Chi phí dự kiến: ", formatCurrency(contract.getChiphidukien()), textFont);
            addTextToDocument(document, "Chi phí phát sinh: ", formatCurrency(contract.getChiphiphatsinh()), textFont);
            addTextToDocument(document, "Tiền cọc: ", formatCurrency(contract.getTiencoc()), textFont);
            addTextToDocument(document, "Tổng chi phí: ", formatCurrency(contract.getTongtien()), textFont);
            document.add(new Paragraph(" "));

            // Điều khoản và điều kiện
            Paragraph termsTitle = new Paragraph("Điều khoản và điều kiện:", titleFont);
            termsTitle.setAlignment(Element.ALIGN_CENTER);
            document.add(termsTitle);

            document.add(new Paragraph(" "));
            Paragraph terms = new Paragraph();
            terms.add(new Chunk("1. ", textFont));
            terms.add(new Phrase("Điều khoản 1.", textFont));
            terms.add(Chunk.NEWLINE);
            terms.add(new Chunk("2. ", textFont));
            terms.add(new Phrase("Điều khoản 2.", textFont));
            terms.add(Chunk.NEWLINE);
            terms.add(new Chunk("3. ", textFont));
            terms.add(new Phrase("Điều khoản 3.", textFont));
            document.add(terms);

         // Kí tên bên A và bên B
            document.add(new Paragraph(" "));
            Paragraph signSection = new Paragraph();
            signSection.setAlignment(Element.ALIGN_CENTER);

            Chunk textBenA = new Chunk("Đại diện bên A", textFont);
            signSection.add(textBenA);

            // Thêm nhiều tab để tạo khoảng cách xa hơn
            signSection.add(Chunk.TABBING);
            signSection.add(Chunk.TABBING);
            signSection.add(Chunk.TABBING);
            signSection.add(Chunk.TABBING);
            signSection.add(Chunk.TABBING);
            signSection.add(Chunk.TABBING);

            Chunk textBenB = new Chunk("Đại diện bên B", textFont);
            signSection.add(textBenB);

            signSection.add(new Phrase("\n\n"));
            signSection.add(new Phrase("\n\n"));
            
            signSection.add(Chunk.TABBING);
            signSection.add(new Chunk("OBBM", textFont));
            
            signSection.add(Chunk.TABBING);
            signSection.add(Chunk.TABBING);
            signSection.add(Chunk.TABBING);
            signSection.add(Chunk.TABBING);
            signSection.add(Chunk.TABBING);
            signSection.add(Chunk.TABBING);

            signSection.add(new Chunk(contract.getMakhachhang().getTenkhachhang(), textFont));

            document.add(signSection);
            document.close();

        } catch (DocumentException | IOException e) {
            e.printStackTrace();
            throw e; // Throw exception for handling in the calling method
        }

        return new ByteArrayInputStream(out.toByteArray());
    }

    private void addTextToDocument(Document document, String label, String content, Font font) throws DocumentException {
        Paragraph paragraph = new Paragraph();
        paragraph.add(new Chunk(label, font));
        paragraph.add(new Phrase(content, font));
        document.add(paragraph);
        document.add(Chunk.NEWLINE);
    }

    private String formatDate(java.util.Date date) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        return sdf.format(date);
    }

    private String formatCurrency(double amount) {
        return String.format("%,.0f VNĐ", amount);
    }
}
