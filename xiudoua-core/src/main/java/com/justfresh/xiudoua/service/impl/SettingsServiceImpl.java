package com.justfresh.xiudoua.service.impl;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.justfresh.xiudoua.dao.JfSettingsMapper;
import com.justfresh.xiudoua.entity.Page;
import com.justfresh.xiudoua.entity.SiteConfig;
import com.justfresh.xiudoua.model.JfSettings;
import com.justfresh.xiudoua.model.JfSettingsExample;
import com.justfresh.xiudoua.service.ISettingsService;
import com.justfresh.xiudoua.utils.StringUtil;

@Service("settingsService")
public class SettingsServiceImpl implements ISettingsService {
	
	@Autowired
	private JfSettingsMapper settingsMapper;
	
	//字符串首字母大写
	private String captureName(String name) {
		// name = name.substring(0, 1).toUpperCase() + name.substring(1);
		// return name;
		char[] cs = name.toCharArray();
		cs[0] -= 32;
		return String.valueOf(cs);

	}
	
	private JfSettingsExample getExample(JfSettings param){
		
		JfSettingsExample example = new JfSettingsExample();
		JfSettingsExample.Criteria c = example.createCriteria();
		if(param.getSort() != null && param.getSort()!="") {
			example.setOrderByClause(StringUtil.camelToUnderline(param.getSort()));
		}
		if(param.getName() != null && !"".equals(param.getName())){
			c.andNameLike("%" + param.getName() + "%");
		}
		return example;
		
	}

	public int add(JfSettings param) throws Exception {
		if(param.getName() == null || "".equals(param.getName())){
			throw new Exception("请输入系统设置关键值！！！");
		}
		return this.settingsMapper.insert(param);
	}

	public int delete(JfSettings param) throws Exception {
		return 0;
	}

	public int update(JfSettings param) throws Exception {
		if(param.getName() == null || "".equals(param.getName())){
			throw new Exception("请选择要修改的记录！！！");
		}
		return this.settingsMapper.updateByPrimaryKeySelective(param);
	}

	public JfSettings getOne(JfSettings param) throws Exception {
		if(param.getName() == null || "".equals(param.getName())){
			throw new Exception("请选择要查询的记录！！！");
		}
		return this.settingsMapper.selectByPrimaryKey(param.getName());
	}

	public List<JfSettings> getList(JfSettings param) throws Exception {
		return this.settingsMapper.selectByExample(this.getExample(param));
	}

	public Page<JfSettings> page(JfSettings param) throws Exception {
		Page<JfSettings> page = new Page<JfSettings>();
		Map<String, String> params = param.getParams();
		JfSettingsExample example = this.getExample(param);
		List<JfSettings> list = new ArrayList<JfSettings>();
		if(params.size()>1){
			list = this.settingsMapper.selectWithPageByExample(example, params);
		}else{
			list = this.settingsMapper.selectByExample(example);
		}
		page.setList(list);
		page.setTotalRecord(this.settingsMapper.countByExample(this.getExample(param)));
		page.setPageSize(param.getRows());
		page.setCurrentPage(param.getPage());
		return page;
	}

	//修改站点设置
	public int editSettings(SiteConfig config) throws Exception {
		if(config != null){
			int count = 0;
			Field[] field = config.getClass().getDeclaredFields();
			for(int i=0;i<field.length;i++){
				String name = field[i].getName();
				String type = field[i].getGenericType().toString();    //获取属性的类型
                if(type.equals("class java.lang.String")){   
                	//如果type是类类型，则前面包含"class "，后面跟类名
                	Method m = config.getClass().getMethod("get"+this.captureName(name));
                    String value = (String) m.invoke(config);
                    if(value == null){
                    	value = "";
                    }
                    if(name != null && !"".equals(name)){
                		JfSettings settings = new JfSettings();
                		settings.setName(name);
                		settings.setValue(value);
                		int res = this.settingsMapper.updateByPrimaryKeySelective(settings);
                		count += res;
                	}
                }
			}
			return count;
		}
		return 0;
	}

}
