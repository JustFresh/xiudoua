package com.justfresh.xiudoua.utils;

import java.io.IOException;
import java.util.Date;

import org.codehaus.jackson.JsonGenerator;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.JsonSerializer;
import org.codehaus.jackson.map.SerializerProvider;
import org.springframework.stereotype.Component;

@Component
public class JsonDateSerializer extends JsonSerializer<Date> {

	@Override
	public void serialize(Date date, JsonGenerator jsonGenerator, SerializerProvider serializerProvider) throws IOException, JsonProcessingException {
		if(DateUtil.format(date, "HH:mm:ss").equalsIgnoreCase("00:00:00") ) {
			jsonGenerator.writeString(DateUtil.format(date, "yyyy-MM-dd"));
		} else {
			jsonGenerator.writeString(DateUtil.format(date, "yyyy-MM-dd HH:mm"));
		}
	}
}
