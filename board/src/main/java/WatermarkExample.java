 
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
 
import org.apache.pdfbox.multipdf.Overlay;
import org.apache.pdfbox.pdmodel.PDDocument;
 
public class WatermarkExample {
 
	public static void main(String args[]) {
 
		try {
 
			// 워터마크 적용할  PDF file 경로 설정
			PDDocument pdDocument = PDDocument
					.load(new File("C:\\PdfBox_Examples\\HLK홀딩스_SSL견적서.pdf"));
 
			// 워터마크 PDF 
			HashMap<Integer, String> overlayProps = new HashMap<Integer, String>();
			for (int i = 0; i < pdDocument.getNumberOfPages(); i++) {
				overlayProps.put(i + 1, "C:\\PdfBox_Examples\\watermark.pdf");
			}
 
			// Using the Overlay object add the map of properties to the PDF
			Overlay overlay = new Overlay();
			overlay.setInputPDF(pdDocument);
			overlay.setOverlayPosition(Overlay.Position.FOREGROUND);
			overlay.overlay(overlayProps);
 
			// Save the PDF to a new or same location
			pdDocument.save("C:\\PdfBox_Examples\\watermark_test1.pdf");
			pdDocument.close();
			System.out.println("PDF saved to the location !!!");
 
		} catch (IOException ioe) {
			System.out.println("Error while saving pdf" + ioe.getMessage());
		}
 
	}
 
}