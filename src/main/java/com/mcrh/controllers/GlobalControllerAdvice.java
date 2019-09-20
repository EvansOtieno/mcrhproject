package com.mcrh.controllers;

import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;


@ControllerAdvice(annotations=Controller.class)
public class GlobalControllerAdvice {

	@ModelAttribute("sex")
	public List<String> teams(){
		return new LinkedList<>(Arrays.asList(new String[]
				{
						"Male","Female"
				}));
	}
	@ModelAttribute("birthtype")
	public List<String> getmajors(){
		return new LinkedList<>(Arrays.asList(new String[]
				{
						"Single","Twin"
				}));
	}
	@ModelAttribute("birthnature")
	public List<String> gethalls(){
		return new LinkedList<>(Arrays.asList(new String[]
				{
						"Alive","Dead"
				}));
	}
	
}
