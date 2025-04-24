package kr.util;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.UUID;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;

public class FileUtil {
	//업로드 상대 경로
	public static final String UPLOAD_PATH = "upload";
	
	//파일 업로드
	public static String uploadFile(
			                    HttpServletRequest request,
			                        String param)
			            throws IOException,ServletException{
		// Save to deployed upload folder
		String deployPath = request.getServletContext().getRealPath(UPLOAD_PATH);
		File deployDir = new File(deployPath);
		if (!deployDir.exists()) {
			deployDir.mkdirs();
		}
		Part part = request.getPart(param);
		String filename = part.getSubmittedFileName();
		if(!filename.isEmpty()) {
			//파일명이 중복되지 않도록 파일명 변경 (8자리)
			String uniqueId = UUID.randomUUID().toString().substring(0, 8);
			//원래 파일명을 보존하지 않을 경우
			filename = uniqueId + filename.substring(filename.lastIndexOf("."));
			// write to deployed folder
			part.write(deployPath + File.separator + filename);
			// also copy to project source folder for git management
			String projectRoot = System.getProperty("user.dir");
			String sourcePath = projectRoot + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator + UPLOAD_PATH;
			File sourceDir = new File(sourcePath);
			if (!sourceDir.exists()) {
				sourceDir.mkdirs();
			}
			Files.copy(Paths.get(deployPath, filename), Paths.get(sourcePath, filename), StandardCopyOption.REPLACE_EXISTING);
		}
		return filename;
	}
	
	
	//파일 삭제
	public static void removeFile(HttpServletRequest request,
			                      String filename) {
		if(filename!=null) {
			// Remove from deployed folder
			String deployPath = request.getServletContext().getRealPath(UPLOAD_PATH);
			File file = new File(deployPath + File.separator + filename);
			if(file.exists()) file.delete();
			// also remove from project source folder
			String projectRoot = System.getProperty("user.dir");
			String sourcePath = projectRoot + File.separator + "src" + File.separator + "main" + File.separator + "webapp" + File.separator + UPLOAD_PATH;
			File srcFile = new File(sourcePath + File.separator + filename);
			if (srcFile.exists()) {
				srcFile.delete();
			}
		}
	}
	
	public static String getFilename(String headerName) {
		for(String name : headerName.split(";")) {
			if(name.trim().startsWith("filename")) {
				String filename = name.substring(name.indexOf("=")+1)
						              .trim()
						              .replace("\"", "");
				int index = filename.lastIndexOf(File.separator);
				return filename.substring(index+1);
			}
		}
		return null;
	}
}
