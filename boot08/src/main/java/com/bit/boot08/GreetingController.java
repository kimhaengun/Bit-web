package com.bit.boot08;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Controller;
import org.springframework.web.util.HtmlUtils;

@Controller
public class GreetingController {
		//응답받는 주소
	  @MessageMapping("/hello")
	   //메세지를 뿌려줄 주소
	  @SendTo("/topic/greetings")
	  public String greeting(HelloMessage message) throws Exception {
	    Thread.sleep(1000); // simulated delay
	    
	    //2. 클라이언트로 부터  /api/hello 요청이 들어오면 해당 메시지를 다시 담아
	    //   SendTo 어노테이션으로 /topic/greetings 주소로 클라이언트에 요청
	    //  (/topic/greetings)를 구독하고 있는 모든 클라이언트들에게 메세지 전송
//	    return new Greeting("Hello, " + HtmlUtils.htmlEscape(message.getName()) + "!");
	    System.out.println("msg : "+message.getName());
	    return "{\"content\":\""+message.getName()+"\"}";
	  }
}
