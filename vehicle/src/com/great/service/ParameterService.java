package com.great.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.great.bean.Parameter;
import com.great.dao.ParameterMapper;

@Service
public class ParameterService {
	@Resource
	private ParameterMapper parameterMapper;
	/**查询表参数
	 * @param mark
	 * @return
	 * @throws Exception
	 */
	public List<Parameter> queryAll(String mark) throws Exception{
		return parameterMapper.queryAll(mark);
	}
	/**查询所有参数
	 * @return
	 * @throws Exception
	 */
	public List<Parameter> all() throws Exception{
		return parameterMapper.all();
	}
	/**存在验证
	 * @param parameter
	 * @return
	 * @throws Exception
	 */
	public boolean exist(Parameter parameter) throws Exception{
		return parameterMapper.exist(parameter)>0;
	}
	/**通过id获取
	 * @param parameterId
	 * @return
	 * @throws Exception
	 */
	public Parameter getById(Integer parameterId) throws Exception{
		return parameterMapper.getById(parameterId);
	}
	/**添加
	 * @param parameter
	 * @return
	 * @throws Exception
	 */
	public boolean add(Parameter parameter) throws Exception{
		return parameterMapper.add(parameter)>0;
	}
	/**修改
	 * @param parameter
	 * @return
	 * @throws Exception
	 */
	public boolean update(Parameter parameter) throws Exception{
		return parameterMapper.update(parameter)>0;
	}
	/**删除
	 * @param parameterId
	 * @return
	 * @throws Exception
	 */
	public boolean delete(Integer parameterId) throws Exception{
		return parameterMapper.delete(parameterId)>0;
	}
}
