package com.justfresh.xiudoua.controller.admin;

import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.justfresh.xiudoua.entity.UploadFile;
import com.justfresh.xiudoua.utils.UploadUtils;
import com.zgwlcsc.cms.page.model.Json;

@Controller
@RequestMapping("/upload")
public class UploadController{
	
	@RequestMapping("/uploadImg")
	@ResponseBody
	public Json uploadImg(@RequestParam(value = "file", required = false) CommonsMultipartFile file,HttpServletRequest request, HttpSession session){
		
		String dirPath = request.getParameter("dirPath");
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		String month = now.get(Calendar.MONTH) + 1 < 10 ? "0" + (now.get(Calendar.MONTH) + 1) : now.get(Calendar.MONTH) + 1 + "";
		String day = now.get(Calendar.DAY_OF_MONTH) < 10 ? "0" + now.get(Calendar.DAY_OF_MONTH) : now.get(Calendar.DAY_OF_MONTH) + "";
		String hour = now.get(Calendar.HOUR_OF_DAY) < 10 ? "0" + now.get(Calendar.HOUR_OF_DAY) : now.get(Calendar.HOUR_OF_DAY) + "";
		String minite = now.get(Calendar.MINUTE) < 10 ? "0" + now.get(Calendar.MINUTE) : now.get(Calendar.MINUTE) + "";
		String second = now.get(Calendar.SECOND) < 10 ? "0" + now.get(Calendar.SECOND) : now.get(Calendar.SECOND) + "";
		if(dirPath == null){
			dirPath = "Uploads/images/default/" + year + "/" + month + "/" + day;
		}else{
			dirPath = "Uploads/images/" + dirPath + "/" + year + "/" + month + "/" + day;
		}
		Json json = new Json();
		try {
			String fileName = file.getOriginalFilename();
			// 获取文件后缀
			String suffix = fileName.substring(fileName.lastIndexOf("."));
			fileName = year + month + day + hour + minite + second + suffix;
			UploadFile uploadFile = new UploadFile();
			uploadFile.setFileName(fileName);
			uploadFile.setFileSuffix(suffix);
			uploadFile.setFilePath(dirPath + "/" + fileName);
			dirPath = request.getSession().getServletContext().getRealPath("/") + dirPath;
			String[] allowTypes = {"gif", "jpeg", "png", "jpg",};
			UploadUtils.UploadState state = UploadUtils.upload4Stream(fileName,dirPath, file.getInputStream(),allowTypes);
			if(state == UploadUtils.UploadState.UPLOAD_SUCCSSS){
				json.setMsg("上传完毕");
				json.setSuccess(true);
			}else if(state == UploadUtils.UploadState.UPLOAD_TYPE_ERROR){
				json.setMsg("上传文件格式不符");
				json.setSuccess(false);
			}else if(state == UploadUtils.UploadState.UPLOAD_FAILURE){
				json.setMsg("上传失败");
				json.setSuccess(false);
			}else if(state == UploadUtils.UploadState.UPLOAD_ZEROSIZE){
				json.setMsg("上传文件不能为空");
				json.setSuccess(false);
			}else if(state == UploadUtils.UploadState.UPLOAD_OVERSIZE){
				json.setMsg("上传文件过大");
				json.setSuccess(false);
			}
			json.setObj(uploadFile);
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
		}
		return json;
	}
	
	@RequestMapping("/uploadExcel")
	@ResponseBody
	public Json uploadExcel(@RequestParam(value = "file", required = false) CommonsMultipartFile file,HttpServletRequest request, HttpSession session){
		String dirPath = request.getParameter("dirPath");
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		String month = now.get(Calendar.MONTH) + 1 < 10 ? "0" + (now.get(Calendar.MONTH) + 1) : now.get(Calendar.MONTH) + 1 + "";
		String day = now.get(Calendar.DAY_OF_MONTH) < 10 ? "0" + now.get(Calendar.DAY_OF_MONTH) : now.get(Calendar.DAY_OF_MONTH) + "";
		String hour = now.get(Calendar.HOUR_OF_DAY) < 10 ? "0" + now.get(Calendar.HOUR_OF_DAY) : now.get(Calendar.HOUR_OF_DAY) + "";
		String minite = now.get(Calendar.MINUTE) < 10 ? "0" + now.get(Calendar.MINUTE) : now.get(Calendar.MINUTE) + "";
		String second = now.get(Calendar.SECOND) < 10 ? "0" + now.get(Calendar.SECOND) : now.get(Calendar.SECOND) + "";
		if(dirPath == null){
			dirPath = "Uploads/xls/" + year + "/" + month + "/" + day;
		}else{
			dirPath = "Uploads/xls/" + dirPath + "/" + year + "/" + month + "/" + day;
		}
		Json json = new Json();
		try {
			String fileName = file.getOriginalFilename();
			// 获取文件后缀
			String suffix = fileName.substring(fileName.lastIndexOf("."));
			fileName = year + month + day + hour + minite + second + suffix;
			UploadFile uploadFile = new UploadFile();
			uploadFile.setFileName(fileName);
			uploadFile.setFileSuffix(suffix);
			uploadFile.setFilePath(dirPath + "/" + fileName);
			dirPath = request.getSession().getServletContext().getRealPath("/") + dirPath;
			String[] allowTypes = {"xls", "xlsx"};
			UploadUtils.UploadState state = UploadUtils.upload4Stream(fileName,dirPath, file.getInputStream(),allowTypes);
			if(state == UploadUtils.UploadState.UPLOAD_SUCCSSS){
				json.setMsg("上传完毕");
				json.setSuccess(true);
			}else if(state == UploadUtils.UploadState.UPLOAD_TYPE_ERROR){
				json.setMsg("上传文件格式不符");
				json.setSuccess(false);
			}else if(state == UploadUtils.UploadState.UPLOAD_FAILURE){
				json.setMsg("上传失败");
				json.setSuccess(false);
			}else if(state == UploadUtils.UploadState.UPLOAD_ZEROSIZE){
				json.setMsg("上传文件不能为空");
				json.setSuccess(false);
			}else if(state == UploadUtils.UploadState.UPLOAD_OVERSIZE){
				json.setMsg("上传文件过大");
				json.setSuccess(false);
			}
			json.setObj(uploadFile);
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
		}
		return json;
	}
	
	@RequestMapping("/uploadRar")
	@ResponseBody
	public Json uploadRar(@RequestParam(value = "file", required = false) CommonsMultipartFile file,HttpServletRequest request, HttpSession session){
		String dirPath = request.getParameter("dirPath");
		Calendar now = Calendar.getInstance();
		int year = now.get(Calendar.YEAR);
		String month = now.get(Calendar.MONTH) + 1 < 10 ? "0" + (now.get(Calendar.MONTH) + 1) : now.get(Calendar.MONTH) + 1 + "";
		String day = now.get(Calendar.DAY_OF_MONTH) < 10 ? "0" + now.get(Calendar.DAY_OF_MONTH) : now.get(Calendar.DAY_OF_MONTH) + "";
		String hour = now.get(Calendar.HOUR_OF_DAY) < 10 ? "0" + now.get(Calendar.HOUR_OF_DAY) : now.get(Calendar.HOUR_OF_DAY) + "";
		String minite = now.get(Calendar.MINUTE) < 10 ? "0" + now.get(Calendar.MINUTE) : now.get(Calendar.MINUTE) + "";
		String second = now.get(Calendar.SECOND) < 10 ? "0" + now.get(Calendar.SECOND) : now.get(Calendar.SECOND) + "";
		if(dirPath == null){
			dirPath = "Uploads/rar/" + year + "/" + month + "/" + day;
		}else{
			dirPath = "Uploads/rar/" + dirPath + "/" + year + "/" + month + "/" + day;
		}
		Json json = new Json();
		try {
			String fileName = file.getOriginalFilename();
			// 获取文件后缀
			String suffix = fileName.substring(fileName.lastIndexOf("."));
			fileName = year + month + day + hour + minite + second + suffix;
			UploadFile uploadFile = new UploadFile();
			uploadFile.setFileName(fileName);
			uploadFile.setFileSuffix(suffix);
			uploadFile.setFilePath(dirPath + "/" + fileName);
			dirPath = request.getSession().getServletContext().getRealPath("/") + dirPath;
			String[] allowTypes = {"rar", "zip"};
			UploadUtils.UploadState state = UploadUtils.upload4Stream(fileName,dirPath, file.getInputStream(),allowTypes);
			if(state == UploadUtils.UploadState.UPLOAD_SUCCSSS){
				json.setMsg("上传完毕");
				json.setSuccess(true);
			}else if(state == UploadUtils.UploadState.UPLOAD_TYPE_ERROR){
				json.setMsg("上传文件格式不符");
				json.setSuccess(false);
			}else if(state == UploadUtils.UploadState.UPLOAD_FAILURE){
				json.setMsg("上传失败");
				json.setSuccess(false);
			}else if(state == UploadUtils.UploadState.UPLOAD_ZEROSIZE){
				json.setMsg("上传文件不能为空");
				json.setSuccess(false);
			}else if(state == UploadUtils.UploadState.UPLOAD_OVERSIZE){
				json.setMsg("上传文件过大");
				json.setSuccess(false);
			}
			json.setObj(uploadFile);
		} catch (Exception e) {
			json.setMsg(e.getMessage());
			json.setSuccess(false);
		}
		return json;
	}
}
