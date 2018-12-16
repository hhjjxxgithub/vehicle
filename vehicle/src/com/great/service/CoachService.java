package com.great.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.great.bean.Coach;
import com.great.dao.CoachMapper;
@Service
public class CoachService {
	@Resource
	private CoachMapper coachMapper;
	/**登录
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public Coach login(Map<String,Object> map) throws Exception{
		return coachMapper.login(map);
	}
	/**查询所有
	 * @return
	 * @throws Exception
	 */
	public List<Map> queryAll() throws Exception{
		return coachMapper.queryAll();
	}
	/**通过ID获取
	 * @param coachId
	 * @return
	 * @throws Exception
	 */
	public Coach getById(Integer coachId) throws Exception{
		return coachMapper.getById(coachId);
	}
	/**账户是否存在
	 * @param coachAccount
	 * @return
	 * @throws Exception
	 */
	public boolean accountExist (String coachAccount) throws Exception{
		return coachMapper.accountExist(coachAccount)>0;
	}
	/**身份证号是否存在
	 * @param coachCard
	 * @return
	 * @throws Exception
	 */
	public boolean cardExist (String coachCard) throws Exception{
		return coachMapper.cardExist(coachCard)>0;
	}
	/**添加教练
	 * @param coach
	 * @return
	 * @throws Exception
	 */
	public boolean add (Coach coach) throws Exception{
		return coachMapper.add(coach)>0;
	}
	/**更新教练
	 * @param coach
	 * @return
	 * @throws Exception
	 */
	public boolean update (Coach coach) throws Exception{
		return coachMapper.update(coach)>0;
	}
	/**删除教练
	 * @param coachId
	 * @return
	 * @throws Exception
	 */
	public boolean delete (Integer coachId) throws Exception{
		return coachMapper.delete(coachId)>0;
	}
}
