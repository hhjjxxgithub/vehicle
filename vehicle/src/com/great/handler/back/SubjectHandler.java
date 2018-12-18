package com.great.handler.back;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.great.bean.Subject;
import com.great.service.LevelService;
import com.great.service.SubjectService;
import com.great.util.ParamMap;
import com.great.util.Result;

/**后台subject控制器
 * @author 
 *
 */
@Controller("backSubject")
@RequestMapping("/back/subject")
public class SubjectHandler {
	@Resource
	private ParameterHandler parameterHandler;
	
	@Resource
	private SubjectService subjectService;
	
	@Resource
	private LevelService levelServie;
	
	/**参数
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/subject.handler")
	public String subject(HttpServletRequest request) throws Exception {
		ObjectMapper o= new ObjectMapper();
		request.setAttribute("param", o.writeValueAsString(parameterHandler.getMap("subject")));
		request.setAttribute("levelList",levelServie.queryAll());
		return "forward:/WEB-INF/back/subject_list.jsp";
	}
	/**上传
	 * @param file
	 * @param levelId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/upload.handler")
	public @ResponseBody Result upload(
			@RequestParam MultipartFile file,Integer levelId
			) throws Exception {
		Workbook workbook = WorkbookFactory.create(file.getInputStream());
		Sheet sheet = workbook.getSheetAt(0);
		Map map = new HashMap<>();
		Object [][] array = new Object[sheet.getPhysicalNumberOfRows()][];
		map.put("levelId", levelId);
		map.put("l1", array);
		for(int i=0;i<sheet.getPhysicalNumberOfRows();i++){
			Row row = sheet.getRow(i);
			array[i] = new Object[row.getPhysicalNumberOfCells()];
			for(int j = 0;j<row.getPhysicalNumberOfCells();j++){
				Cell cell = row.getCell(j);
				cell.setCellType(Cell.CELL_TYPE_STRING);
				array[i][j] = cell.getStringCellValue();
			}
		}
		if(subjectService.upload(map)){
			return Result.success(null);
		}else {
			return Result.fail();
		}
	}
	/**添加题目
	 * @param subject
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/add.handler")
	public @ResponseBody Result add(
			@RequestBody Subject subject
			) throws Exception {
		if(subjectService.add(subject)){
			return Result.success(null);
		}else{
			return Result.fail();
		}
	}
	/**所有题目列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/subjectList.handler")
	public @ResponseBody List subjectList() throws Exception {
		return subjectService.queryAll();
	}
	
	/**通过id获取
	 * @param subjectId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/getById.handler")
	public @ResponseBody Result getById(
			@RequestParam(value="subjectId",required=true) Integer subjectId
			) throws Exception {
		Subject subject = subjectService.getById(subjectId);
		if(subject == null){
			return Result.fail();
		}else{
			return Result.success(subject);
		}
	}
	/**删除
	 * @param subjectId
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/delete.handler")
	public @ResponseBody Result delete(
			@RequestParam(value="subjectId",required=true) Integer subjectId
			) throws Exception {
		if(!subjectService.delete(subjectId)){
			return Result.fail();
		}else{
			return Result.success(null);
		}
	}
	/**修改
	 * @param subject
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "/update.handler")
	public @ResponseBody Result update(
			@RequestBody Subject subject
			) throws Exception {
		if(subjectService.update(subject)){
			return Result.success(null);
		}else{
			return Result.fail();
		}
	}
}
