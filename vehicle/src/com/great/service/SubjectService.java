package com.great.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.great.bean.Coach;
import com.great.bean.Level;
import com.great.bean.Subject;
import com.great.dao.LevelMapper;
import com.great.dao.SubjectMapper;

@Service
public class SubjectService {
	@Resource
	private  SubjectMapper subjectMapper;
	/**上传
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public boolean upload(Map map) throws Exception{
		return subjectMapper.upload(map) > 0;
	}
	/**添加
	 * @param subject
	 * @return
	 * @throws Exception
	 */
	public boolean add (Subject subject) throws Exception{
		return subjectMapper.add(subject) > 0;
	}
	/**修改
	 * @param subject
	 * @return
	 * @throws Exception
	 */
	@Transactional(isolation=Isolation.READ_COMMITTED,propagation=Propagation.REQUIRED,
			rollbackFor=Exception.class)
	public boolean update (Subject subject) throws Exception{
		boolean flag = false;
		try {
			subjectMapper.reset(subject.getSubjectId());
			subjectMapper.update(subject);
			flag = true;
		} catch (Exception e) {
			throw e;
		}finally {
			return flag;
		}
	}
	/**删除
	 * @param subjectId
	 * @return
	 * @throws Exception
	 */
	public boolean delete (Integer subjectId) throws Exception{
		return subjectMapper.delete(subjectId)>0;
	}
	/**查找全部
	 * @return
	 * @throws Exception
	 */
	public List queryAll() throws Exception{
		return subjectMapper.queryAll();
	}
	/**通过id查找
	 * @param subjectId
	 * @return
	 * @throws Exception
	 */
	public Subject getById(Integer subjectId) throws Exception{
		return subjectMapper.getById(subjectId);
	}
}
