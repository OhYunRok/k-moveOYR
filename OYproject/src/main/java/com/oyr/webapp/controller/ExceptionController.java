package com.oyr.webapp.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class ExceptionController {
   Logger logger = LoggerFactory.getLogger(ExceptionController.class);

   @ExceptionHandler
   public String handlerError(HttpServletRequest request, Exception exception) {
      
      logger.error("Request: " + request.getRequestURL() + " raised "  + exception);
      logger.error("Exception Trace: ", exception);
      
      String ajaxHeader= request.getHeader("AJAX");
      
      if(ajaxHeader != null && ajaxHeader.contentEquals("true")) {
         request.setAttribute("msg", exception.toString());
         return "forward:/handling";
      }else {

         return "exceptionHandler";
      }
   }
}